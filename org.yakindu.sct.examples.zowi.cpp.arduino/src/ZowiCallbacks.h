#include "../src-gen/ZowiSCT.h"

#ifndef SRC_ZOWICALLBACKS_H_
#define SRC_ZOWICALLBACKS_H_

class ZowiCallbacks : public ZowiSCT::Zowi::OperationCallback{
public:
	ZowiCallbacks();
	virtual ~ZowiCallbacks();

	void init();

	void home();

	void walk(sc_integer steps, sc_integer T, sc_integer dir);

	void turn();

	sc_real getDistance();

	sc_real getNoise();

	void putMouth(sc_integer mouth);

	void sing(sc_integer songName);
};

#endif /* SRC_ZOWICALLBACKS_H_ */
