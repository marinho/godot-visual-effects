using Godot;
using System;

public partial class MultiParticles : Node3D
{
	[Export]
	public bool Emitting = true;

	[Export]
	public bool OneShot = false;

	[Export]
	public Godot.Collections.Array<GpuParticles3D> Particles;

	double Lifetime = 0.0f;

	public override void _Ready()
	{
		if (Emitting)
		{
			StartEmitters();
		}
	}

	void GetLifetime()
	{
		foreach (var particle in Particles)
		{
			if (particle.Lifetime > Lifetime)
			{
				Lifetime = particle.Lifetime;
			}
		}
	}

	public async void StartEmitters()
	{
		GetLifetime();

		foreach (var particle in Particles)
			particle.Emitting = true;

		await ToSignal(GetTree().CreateTimer(Lifetime), SceneTreeTimer.SignalName.Timeout);
		DisposeOfEmitters();

		if (!OneShot)
		{
			StartEmitters();
		}
	}

	void DisposeOfEmitters()
	{
		foreach (var particle in Particles)
		{
			particle.Emitting = false;
		}
	}

}
