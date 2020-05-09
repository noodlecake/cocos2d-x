/*
 * cocos2d for iPhone: http://www.cocos2d-iphone.org
 *
 * Copyright (c) 2011 Ricardo Quesada
 * Copyright (c) 2012 Zynga Inc.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

const char* ccPositionTextureColor_noMVP_frag = R"(

#ifdef GL_ES
//#extension GL_OES_standard_derivatives : enable
precision lowp float;
#endif

varying vec4 v_fragmentColor;
varying vec2 v_texCoord;

void main()
{
    vec4 sample_color = texture2D(CC_Texture0, v_texCoord);
    
    float alpha = sample_color.a;
    vec3 color = sample_color.rgb;
    
    float alphaDx = dFdx(alpha);
    float alphaDy = dFdy(alpha);
    
    vec4 sampleDy = dFdy(sample_color);
    vec4 sampleDx = dFdx(sample_color);
    
    // only modify pixels with an alpha in this range
    bool within_range = alpha > 0.05 && alpha < 0.95;
    
    if(within_range && abs(alphaDx) >= 0.2 && length(sampleDy) == 0.0) {
        // dX > 0.2 && zero change in y direction
        // (vertical lines)
        gl_FragColor = vec4(1.0,0.0,0.0,1.0); // red to test
        //gl_FragColor = vec4(sample_color.rgb/alpha, 1.0);
        return;
    }
    else if(within_range && abs(alphaDy) >= 0.2 && length(sampleDx) == 0.0) {
        // dY > 0.2 && zero change in x direction
        // (horizonal lines)
        gl_FragColor = vec4(1.0,0.0,0.0,1.0); // red to test
        //gl_FragColor = vec4(sample_color.rgb/alpha, 1.0);
        return;
    }
    
    // default shading
    gl_FragColor = v_fragmentColor * texture2D(CC_Texture0, v_texCoord);
}
)";

