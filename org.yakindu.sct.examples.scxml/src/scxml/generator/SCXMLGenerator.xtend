/**
 * copyright 2016 by andreas muelder (a.muelder@gmail.com)
 */
package scxml.generator

import java.io.File
import java.io.FileOutputStream
import org.eclipse.xtext.generator.IFileSystemAccess
import org.yakindu.sct.generator.core.ISGraphGenerator
import org.yakindu.sct.model.sgen.GeneratorEntry
import org.yakindu.sct.model.sgraph.Entry
import org.yakindu.sct.model.sgraph.Region
import org.yakindu.sct.model.sgraph.State
import org.yakindu.sct.model.sgraph.Statechart
import org.yakindu.sct.model.sgraph.Transition

class SCXMLGenerator implements ISGraphGenerator {
	

	override generate(Statechart sc, GeneratorEntry entry,  IFileSystemAccess fsa) {
		
		fsa.generateFile(sc.name + '.scxml', sc.generate as String)
	}

	def dispatch String generate(Statechart it) '''
		<?xml version="1.0" encoding="UTF-8"?>
		<scxml xmlns="http://www.w3.org/2005/07/scxml" version="1.0" initial="«regions.head.initialState»">
			«regions.head.generate»
		</scxml>
	'''

	def private String initialState(Region region) {
		region.vertices.filter(Entry).head.outgoingTransitions.head.target.name
	}

	def dispatch CharSequence generate(Region it) '''
		«FOR vertex : vertices.filter(State)»
			«vertex.generate»
		 «ENDFOR»
	'''

	def dispatch CharSequence generate(State it) '''
		<state id="«name»">
			«FOR transition : outgoingTransitions»
				«transition.generate»
			«ENDFOR»
		</state>
	'''

	def dispatch CharSequence generate(Transition it) '''
		<transition event="«specification»" target="«target.name»"/>
	'''

	def write(File dir, String filename, String content) {
		dir.mkdirs
		val bos = new FileOutputStream(new File(dir.path + File::separator + filename))
		bos.write(content.bytes)
		bos.close
	}
	

	
}
