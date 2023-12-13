/**
 * Draws a filled circle
 */
float drawFullCircle(vec2 center, float radius, vec2 uv)
{
    return (distance(center, uv) <= radius) ? 1. : 0.;
}

/**
 * Draws a line circle
 */
float drawLineCircle(vec2 center, float radius, float stroke, vec2 uv)
{
    return drawFullCircle(center, radius, uv)
		 - drawFullCircle(center, radius - stroke, uv);
}

/**
 * Draws a line from p1 to p2
 * 
 * @param p1 	 vec2	
 * @param p2 	 vec2	
 * @param stroke float	
 * @param uv 	 float	to receive uv from fragment function
 * @param one_px float 	This param should receive SCREEN_PIXEL_SIZE.x, as SCREEN_PIXEL_SIZE 
 * 						cannot be accessed from outside fragment() function
 */
float drawLine(vec2 p1, vec2 p2, float stroke, vec2 uv, float one_px)
{
    float r = 0.;
    
    // get dist between points
    float d = distance(p1, p2);
    
    // get dist between current pixel and p1
    float duv = distance(p1, uv);

    //if point is on line, according to dist, it should match current uv 
    r = 1.-floor(1.-(stroke * one_px)+distance (mix(p1, p2, clamp(duv/d, 0., 1.)), uv));
        
    return r;
}

/**
 * Draws a triangle
 */
float drawTriangle(vec2 p1, vec2 p2, vec2 p3, float stroke, vec2 uv, float one_px) {
    return drawLine(p1, p2, stroke, uv, one_px)
         + drawLine(p2, p3, stroke, uv, one_px)
         + drawLine(p3, p1, stroke, uv, one_px);
}

/**
 * Draws a triangle with no baseline
 */
float drawArrowTriangle(vec2 p1, vec2 p2, vec2 p3, float stroke, vec2 uv, float one_px) {
    return drawLine(p1, p2, stroke, uv, one_px)
         + drawLine(p3, p1, stroke, uv, one_px);
}
