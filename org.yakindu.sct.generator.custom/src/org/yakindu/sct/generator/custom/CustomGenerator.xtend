package org.yakindu.sct.generator.custom

import org.eclipse.xtext.generator.IFileSystemAccess
import org.yakindu.sct.generator.core.ISGraphGenerator
import org.yakindu.sct.model.sgen.GeneratorEntry
import org.yakindu.sct.model.sgraph.Region
import org.yakindu.sct.model.sgraph.State
import org.yakindu.sct.model.sgraph.Statechart
import org.yakindu.sct.model.sgraph.Entry

class CustomGenerator implements ISGraphGenerator {

	override generate(Statechart sm, GeneratorEntry entry, IFileSystemAccess access) {
		access.generateFile(sm.name + '.txt', sm.generate.toString());
	}

	def dispatch String generate(Statechart it) {
		'''
			The name of the state machine is '«name»'
			«FOR Region region : regions»
				«region.generate»
			«ENDFOR»
		'''.toString
	}

	def dispatch String generate(Region it) {
		'''
			I am a region «name»
			«FOR state : vertices»
				«state.generate»
			«ENDFOR»
		'''
	}

	def dispatch String generate(State it) {
		'''
			I am a state «name»
			«FOR region : regions»
				«region.generate»
			«ENDFOR»
		'''
	}

	def dispatch String generate(Entry it) {
		'''
			I am an entry of kind «it.kind.toString»
		'''

	}
}
