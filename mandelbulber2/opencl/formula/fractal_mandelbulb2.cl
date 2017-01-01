/**
 * Mandelbulber v2, a 3D fractal generator
 * Copyright (C) 2017 Krzysztof Marczak
 * This file is part of Mandelbulber.
 * License is GPL, see also COPYING file.
 *
 * Fractal formula created by Buddhi
 */

/* ### This file has been autogenerated. Remove this line, to prevent override. ### */

void Mandelbulb2Iteration(float3 &z, sExtendedAux &aux)
{
	aux.r_dz = aux.r_dz * 2.0f * aux.r;

	float temp, tempR;
	tempR = native_sqrt(mad(z.y, z.y, z.x * z.x)); //+ 1e-061f
	z *= native_recip(tempR);
	temp = mad(-z.y, z.y, z.y);
	z.y = 2.0f * z.x * z.y;
	z.x = temp;
	z *= tempR;

	tempR = native_sqrt(mad(z.z, z.z, z.y * z.y)); //+ 1e-061f
	z *= native_recip(tempR);
	temp = mad(-z.z, z.z, z.z);
	z.z = 2.0f * z.y * z.z;
	z.y = temp;
	z *= tempR;

	tempR = native_sqrt(mad(z.z, z.z, z.x * z.x)); //+ 1e-061f
	z *= native_recip(tempR);
	temp = mad(-z.z, z.z, z.z);
	z.z = 2.0f * z.x * z.z;
	z.x = temp;
	z *= tempR;

	z = z * aux.r;
}