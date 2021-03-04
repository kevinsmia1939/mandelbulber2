/**
 * Mandelbulber v2, a 3D fractal generator  _%}}i*<.        ____                _______
 * Copyright (C) 2020 Mandelbulber Team   _>]|=||i=i<,     / __ \___  ___ ___  / ___/ /
 *                                        \><||i|=>>%)    / /_/ / _ \/ -_) _ \/ /__/ /__
 * This file is part of Mandelbulber.     )<=i=]=|=i<>    \____/ .__/\__/_//_/\___/____/
 * The project is licensed under GPLv3,   -<>>=|><|||`        /_/
 * see also COPYING file in this folder.    ~+{i%+++
 *
 * JosLeys-Kleinian V2 formula
 * @reference
 * http://www.fractalforums.com/3d-fractal-generation/an-escape-tim-algorithm-for-kleinian-group-limit-sets/msg98248/#msg98248
 * This formula contains aux.color and aux.DE

 * This file has been autogenerated by tools/populateUiInformation.php
 * from the file "fractal_jos_kleinian_v3.cpp" in the folder formula/definition
 * D O    N O T    E D I T    T H I S    F I L E !
 */

REAL4 PolyfoldAbs(REAL4 z, __constant sFractalCl *fractal, sExtendedAuxCl *aux)
{
	if (fractal->transformCommon.functionEnabledPFalse
			&& aux->i >= fractal->transformCommon.startIterationsP
			&& aux->i < fractal->transformCommon.stopIterationsP1)
	{
		if (fractal->transformCommon.functionEnabledx) z.x = fabs(z.x);
		if (fractal->transformCommon.functionEnabledy) z.y = fabs(z.y);
		if (fractal->transformCommon.functionEnabledz) z.z = fabs(z.z);

		if (fractal->transformCommon.functionEnabledCx)
		{
			REAL psi = M_PI_F / fractal->transformCommon.int8X;
			psi = fabs(fmod(atan2(z.y, z.x) + psi, 2.0f * psi) - psi);
			REAL len = native_sqrt(z.x * z.x + z.y * z.y);
			z.x = native_cos(psi) * len;
			z.y = native_sin(psi) * len;
		}

		if (fractal->transformCommon.functionEnabledCyFalse)
		{
			REAL psi = M_PI_F / fractal->transformCommon.int8Y;
			psi = fabs(fmod(atan2(z.z, z.y) + psi, 2.0f * psi) - psi);
			REAL len = native_sqrt(z.y * z.y + z.z * z.z);
			z.y = native_cos(psi) * len;
			z.z = native_sin(psi) * len;
		}

		if (fractal->transformCommon.functionEnabledCzFalse)
		{
			REAL psi = M_PI_F / fractal->transformCommon.int8Z;
			psi = fabs(fmod(atan2(z.x, z.z) + psi, 2.0f * psi) - psi);
			REAL len = native_sqrt(z.z * z.z + z.x * z.x);
			z.z = native_cos(psi) * len;
			z.x = native_sin(psi) * len;
		}
		// addition constant
		z += fractal->transformCommon.offsetF000;
	}
	return z;
}




REAL4 JosKleinianV3Iteration(REAL4 z, __constant sFractalCl *fractal, sExtendedAuxCl *aux)
{
	if (!fractal->transformCommon.functionEnabledIFalse)
		z = PolyfoldAbs(z, fractal, aux);

	REAL rr = 0.0f;
	// sphere inversion
	if (fractal->transformCommon.sphereInversionEnabledFalse
			&& aux->i >= fractal->transformCommon.startIterationsD
			&& aux->i < fractal->transformCommon.stopIterationsD1)
	{
		z += fractal->transformCommon.offset000;
		rr = dot(z, z);
		z *= fractal->transformCommon.maxR2d1 / rr;
		z += fractal->transformCommon.additionConstant000 - fractal->transformCommon.offset000;
		z *= fractal->transformCommon.scaleA1;
		aux->DE *= (fractal->transformCommon.maxR2d1 / rr) * fractal->analyticDE.scale1
							 * fractal->transformCommon.scaleA1;
	}


	if (fractal->transformCommon.functionEnabledOFalse
			&& aux->i >= fractal->transformCommon.startIterationsO
			&& aux->i < fractal->transformCommon.stopIterationsO)
	{
		REAL4 temp = fractal->transformCommon.constantMultiplier221;
		z.x -= round(z.x / temp.x) * temp.x;
		z.y -= round(z.y / temp.y) * temp.y;
		z.z -= round(z.z / temp.z) * temp.z;
	}

	if (fractal->transformCommon.functionEnabledCFalse
			&& aux->i >= fractal->transformCommon.startIterationsC
			&& aux->i < fractal->transformCommon.stopIterationsC1)
	{
		if (z.y > z.x)
		{
			REAL temp = z.x;
			z.x = z.y;
			z.y = temp;
		}
	}

	if (fractal->transformCommon.functionEnabledIFalse)
		z = PolyfoldAbs(z, fractal, aux);

	if (fractal->transformCommon.functionEnabledFalse
			&& aux->i >= fractal->transformCommon.startIterations
			&& aux->i < fractal->transformCommon.stopIterations1)
	{
		// square
		if (fractal->transformCommon.functionEnabledBx) z.x = max(fabs(z.x), fabs(z.y));
		// circle
		if (fractal->transformCommon.functionEnabledOFalse) z.x = native_sqrt((z.x * z.x) + (z.y * z.y));
	}

	// kleinian
	if (aux->i >= fractal->transformCommon.startIterationsF
			&& aux->i < fractal->transformCommon.stopIterationsF)
	{
		REAL4 box_size = fractal->transformCommon.offset111;
		REAL a = fractal->transformCommon.foldingValue;
		REAL b = fractal->transformCommon.offset;
		REAL f = sign(b);

		z.x += box_size.x;
		z.y += box_size.y;
		z.x = z.x - 2.0f * box_size.x * floor(z.x / 2.0f * box_size.x) - box_size.x;
		z.y = z.y - 2.0f * box_size.y * floor(z.y / 2.0f * box_size.y) - box_size.y;

		z.z += box_size.z - 1.0f;
		z.z = z.z - a * box_size.z * floor(z.z / a * box_size.z);
		z.z -= (box_size.z - 1.0f);

		if (z.y >= a * (0.5f + 0.2f * native_sin(f * M_PI_F * (z.x + b * 0.5f) / box_size.x)))
		{
			z.x = -z.x - b;
			z.z = -z.z + a;
		}

		REAL useScale = 1.0f;
		useScale = 1.0f - aux->actualScaleA;
		z *= useScale;
		aux->DE = aux->DE * fabs(useScale) * fractal->transformCommon.scale1;
		if (fractal->transformCommon.functionEnabledKFalse)
		{
			// update actualScaleA for next iteration
			aux->actualScaleA = fractal->transformCommon.scaleVary0
									* (fabs(aux->actualScaleA) + 1.0f);
		}

		rr = dot(z, z);
		REAL iR = 1.0f / rr;
		aux->DE *= iR;
		z *= -iR; // invert and mirror
		z.x = -z.x - b;
		z.z = a + z.z;
	}

	if (fractal->transformCommon.functionEnabledEFalse
			&& aux->i >= fractal->transformCommon.startIterationsE
			&& aux->i < fractal->transformCommon.stopIterationsE)
	{
		z.y = sign(z.y)
					* (fractal->transformCommon.offset1 - fabs(z.y)
						 + fabs(z.y) * fractal->transformCommon.scale0);
	}

	REAL Ztemp = z.z;
	if (aux->i >= fractal->transformCommon.startIterationsG)
	{
		if (fractal->transformCommon.spheresEnabled)
			Ztemp = min(z.z, fractal->transformCommon.foldingValue - z.z);

		aux->dist = min(Ztemp + fractal->analyticDE.offset0, fractal->analyticDE.tweak005)
								/ max(aux->DE, fractal->analyticDE.offset1);
	}

	if (fractal->transformCommon.functionEnabledTFalse
			&& aux->i >= fractal->transformCommon.startIterationsT
			&& aux->i < fractal->transformCommon.stopIterationsT)
	{
		z.z = Ztemp;
	}

	// aux->color
	if (fractal->foldColor.auxColorEnabledFalse)
	{
		REAL colorAdd = 0.0f;
		aux->temp1000 = min(aux->temp1000, rr) * fractal->foldColor.difs0000.x;
		colorAdd += fractal->foldColor.difs0000.y * max(fabs(z.x), fabs(z.y));
		colorAdd += aux->temp1000; // temp
		colorAdd += fractal->foldColor.difs0000.z * z.z;
		colorAdd += fractal->foldColor.difs0000.w * rr;
		//colorAdd += fractal->foldColor.difs1;

		if (!fractal->transformCommon.functionEnabledJFalse)
			if (!fractal->transformCommon.functionEnabledMFalse)
				aux->color = colorAdd;
			else
				aux->color += colorAdd;
		else
			aux->color = max(aux->color, colorAdd);
	}
	return z;
}
