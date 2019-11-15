package org.yakindu.sct.generator.custom;

import org.yakindu.sct.generator.core.IGeneratorModule;
import org.yakindu.sct.generator.core.ISGraphGenerator;
import org.yakindu.sct.model.sgen.GeneratorEntry;

import com.google.inject.Binder;

public class CustomGeneratorModule implements IGeneratorModule {

	public void configure(GeneratorEntry entry, Binder binder) {
		binder.bind(ISGraphGenerator.class).to(CustomGenerator.class);
	}
}
