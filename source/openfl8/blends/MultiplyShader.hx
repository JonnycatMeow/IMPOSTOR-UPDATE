package openfl8.blends;

import FlxShader;

class MultiplyShader extends FlxShader
{
	@:glFragmentSource('
		#pragma header
		uniform vec4 uBlendColor;

		vec4 blendMultiply(vec4 base, vec4 blend)
		{
			return base * blend;
		}

		vec4 blendMultiply(vec4 base, vec4 blend, float opacity)
		{
			return (blendMultiply(base, blend) * opacity + base * (1.0 - opacity));
		}

		void main()
		{
			vec4 base = texture2D(bitmap, openfl_TextureCoordv);
			gl_FragColor = blendMultiply(base, uBlendColor, uBlendColor.a);
		}')
	public function new()
	{
		super();
	}
}
