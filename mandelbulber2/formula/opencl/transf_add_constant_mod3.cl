/**
 * Mandelbulber v2, a 3D fractal generator  _%}}i*<.        ____                _______
 * Copyright (C) 2019 Mandelbulber Team   _>]|=||i=i<,     / __ \___  ___ ___  / ___/ /
 *                                        \><||i|=>>%)    / /_/ / _ \/ -_) _ \/ /__/ /__
 * This file is part of Mandelbulber.     )<=i=]=|=i<>    \____/ .__/\__/_//_/\___/____/
 * The project is licensed under GPLv3,   -<>>=|><|||`        /_/
 * see also COPYING file in this folder.    ~+{i%+++
 *
 * Adds c constant to z vector

 * This file has been autogenerated by tools/populateUiInformation.php
 * from the file "fractal_transf_add_constant_mod2.cpp" in the folder formula/definition
 * D O    N O T    E D I T    T H I S    F I L E !
 */

REAL4 TransfAddConstantMod3Iteration(REAL4 z, __constant sFractalCl *fractal, sExtendedAuxCl *aux)
{
	REAL4 signs = (REAL4)(1.0, 1.0, 1.0, 1.0);
	signs.x *= sign(aux->const_c.x);
	signs.y *= sign(aux->const_c.y);
	signs.z *= sign(aux->const_c.z);

	REAL4 offset = fractal->transformCommon.additionConstantA000;
	if (fractal->transformCommon.functionEnabledDFalse) offset *= signs;

	REAL4 t;
	if (!fractal->transformCommon.functionEnabledBFalse) t = aux->const_c - offset;
	else t = z - offset;
	REAL r;
	if (!fractal->transformCommon.functionEnabledAFalse) r = length(t);
	else r = dot(t, t);

	REAL4 offset1 = fractal->transformCommon.offset111;
	if (fractal->transformCommon.functionEnabledCFalse) offset1 *= signs;

	REAL m = (1.0f - fractal->transformCommon.radius1 / r) * fractal->transformCommon.scale1;

	if (r > fractal->transformCommon.radius1)
	{
		offset1 =  offset1 + t * m;
		z +=  offset1;
	}
	if (fractal->transformCommon.functionEnabledPFalse // temp
			&& aux->i >= fractal->transformCommon.startIterationsP
			&& aux->i < fractal->transformCommon.stopIterationsP)
	{
		if (fractal->transformCommon.functionEnabledAx) z.x = fabs(z.x);
		if (fractal->transformCommon.functionEnabledAy) z.y = fabs(z.y);
		if (fractal->transformCommon.functionEnabledAz) z.z = fabs(z.z);
	}
	return z;
}
