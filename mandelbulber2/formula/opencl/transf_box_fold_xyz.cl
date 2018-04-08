/**
 * Mandelbulber v2, a 3D fractal generator  _%}}i*<.        ____                _______
 * Copyright (C) 2017 Mandelbulber Team   _>]|=||i=i<,     / __ \___  ___ ___  / ___/ /
 *                                        \><||i|=>>%)    / /_/ / _ \/ -_) _ \/ /__/ /__
 * This file is part of Mandelbulber.     )<=i=]=|=i<>    \____/ .__/\__/_//_/\___/____/
 * The project is licensed under GPLv3,   -<>>=|><|||`        /_/
 * see also COPYING file in this folder.    ~+{i%+++
 *
 * Box Fold XYZ, set different folding parameters for each axis
 * This formula contains aux.color

 * This file has been autogenerated by tools/populateUiInformation.php
 * from the function "TransfBoxFoldXYZIteration" in the file fractal_formulas.cpp
 * D O    N O T    E D I T    T H I S    F I L E !
 */

REAL4 TransfBoxFoldXYZIteration(REAL4 z, __constant sFractalCl *fractal, sExtendedAuxCl *aux)
{
	REAL4 oldZ = z;
	REAL4 Value4 = fractal->transformCommon.additionConstant222;
	if (fractal->transformCommon.functionEnabledFalse)
		Value4 = 2.0f * fractal->transformCommon.additionConstant111;

	if (z.x > fractal->transformCommon.additionConstant111.x)
	{
		z.x = Value4.x - z.x;
	}
	else if (z.x < -fractal->transformCommon.additionConstant111.x)
	{
		z.x = -Value4.x - z.x;
	}
	if (z.y > fractal->transformCommon.additionConstant111.y)
	{
		z.y = Value4.y - z.y;
	}
	else if (z.y < -fractal->transformCommon.additionConstant111.y)
	{
		z.y = -Value4.y - z.y;
	}
	if (z.z > fractal->transformCommon.additionConstant111.z)
	{
		z.z = Value4.z - z.z;
	}
	else if (z.z < -fractal->transformCommon.additionConstant111.z)
	{
		z.z = -Value4.z - z.z;
	}
	if (fractal->foldColor.auxColorEnabledFalse)
	{
		if (z.x != oldZ.x) aux->color += fractal->mandelbox.color.factor.x;
		if (z.y != oldZ.y) aux->color += fractal->mandelbox.color.factor.y;
		if (z.z != oldZ.z) aux->color += fractal->mandelbox.color.factor.z;
	}
	return z;
}