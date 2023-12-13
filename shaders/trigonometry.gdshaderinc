const vec2 CENTER = vec2(.5, .5);

/**
 * Rotate a shape
 */
vec2 rotate(vec2 origin, vec2 destination, float angleInDegrees) {
    float angle_radians = radians(angleInDegrees);
    float cosTheta = cos(angle_radians);
    float sinTheta = sin(angle_radians);
    
    // Translate the destination to be relative to the origin
    vec2 translatedDestination = destination - origin;
    
    // Apply the rotation transformation
    vec2 rotatedDestination;
    rotatedDestination.x = cosTheta * translatedDestination.x - sinTheta * translatedDestination.y;
    rotatedDestination.y = sinTheta * translatedDestination.x + cosTheta * translatedDestination.y;
    
    // Translate the rotated destination back to its original position
    rotatedDestination += origin;
    
    return rotatedDestination;
}

/**
 * atan2 as defined in other languages
 */
float atan2(float y, float x) {
    if (x > 0.0) {
        return atan(y / x);
    } else if (x < 0.0) {
        if (y >= 0.0) {
            return atan(y / x) + PI;
        } else {
            return atan(y / x) - PI;
        }
    } else {
        if (y > 0.0) {
            return PI / 2.;
        } else if (y < 0.0) {
            return -PI / 2.;
        } else {
            return 0.0;
        }
    }
}

/**
 * Angle in degrees between 2 coords
 */
float getAngleInDegrees(vec2 v1, vec2 v2) {
    return atan2(v1.y - v2.y, v1.x - v2.x) * (180. / PI);
}
