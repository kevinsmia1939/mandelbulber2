/*
 * interface.hpp
 *
 *  Created on: Mar 11, 2014
 *      Author: krzysztof
 */

#ifndef INTERFACE_HPP_
#define INTERFACE_HPP_

#include "parameters.hpp"
#include "render_window.hpp"

//class for main user interface

class cInterface
{
public:
	enum enumReadWrite {read, write};

	cInterface();
	void ShowUi(void);
	void ConnectSignals(void);
	void SynchronizeInterfaceWindow(QWidget *window, parameters::container *par, enumReadWrite mode);
	void SynchronizeInterface(parameters::container *par, parameters::container *parFractal, enumReadWrite mode);
	void ConnectSignalsForSlidersInWindow(QWidget *window);
	void MakeColorButtonsInWindow(QWidget *window);
	void GetNameAndType(QString name, QString *parameterName, QString *type);
	void InitializeFractalUi(QString &uiFileName);
	void StatusText(QString &text, QString &progressText, double progress);
	double ImageScaleComboSelection2Double(int index);
	double CalcMainImageScale(double scale, int previewWidth, int previewHeight, cImage *image);

	QApplication *application;
	RenderWindow *mainWindow;
	QImage *qimage;
	RenderedImage *renderedImage;
	QProgressBar *progressBar;

	cImage *mainImage;

	bool stopRequest;
	bool repeatRequest;

private:

};

extern cInterface *mainInterface;

void MakeIconForButton(QColor &color, QPushButton *pushbutton);

#endif /* INTERFACE_HPP_ */
