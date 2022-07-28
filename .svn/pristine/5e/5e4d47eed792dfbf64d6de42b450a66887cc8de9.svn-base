package kr.co.ejsoft.cims.common.crypto.symm;

import kr.co.ejsoft.cims.common.crypto.BlockCipher;
import kr.co.ejsoft.cims.common.crypto.engine.LeaEngine;
import kr.co.ejsoft.cims.common.crypto.mode.ECBMode;

public class LEA {
	private LEA() {
		throw new AssertionError();
	}

	public static final BlockCipher getEngine() {
		return new LeaEngine();
	}

	public static final class ECB extends ECBMode {
		public ECB() {
			super(getEngine());
		}
	}

}
