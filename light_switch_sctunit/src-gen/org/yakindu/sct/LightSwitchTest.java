/**
* Copyright (c) 2017 committers of YAKINDU and others.
* All rights reserved. This program and the accompanying materials
* are made available under the terms of the Eclipse Public License v1.0
* which accompanies this distribution, and is available at
* http://www.eclipse.org/legal/epl-v10.html
*
* Contributors:
*     committers of YAKINDU - initial API and implementation
*/

package org.yakindu.sct;

import org.junit.*;
import static org.junit.Assert.*;
import org.yakindu.scr.light_switch.Light_SwitchStatemachine;
import org.yakindu.scr.light_switch.Light_SwitchStatemachine.State;

/**
 * Unit TestCase for Light_Switch
 */
@SuppressWarnings("all")
public class LightSwitchTest {
	private Light_SwitchStatemachine statemachine;	
	
	@Before
	public void setUp() {
		statemachine = new Light_SwitchStatemachine();
		statemachine.init();
	}

	@After
	public void tearDown() {
		statemachine = null;
	}
	
	@Test
	public void initialStateIsOff() {
		statemachine.enter();
		assertTrue(statemachine.isStateActive(State.main_region_Off));
	}
	@Test
	public void onAfterRaisingCirculate() {
		statemachine.enter();
		raiseOperate();
		assertTrue(statemachine.isStateActive(State.main_region_On));
	}
	@Test
	public void offAfterRaisingOperateSecondTime() {
		statemachine.enter();
		raiseOperate();
		raiseOperate();
		assertTrue(statemachine.isStateActive(State.main_region_Off));
	}
	public void raiseOperate() {
		statemachine.raiseOperate();
		statemachine.runCycle();
	}
}
