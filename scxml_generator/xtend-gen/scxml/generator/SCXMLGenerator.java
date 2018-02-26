/**
 * copyright 2016 by andreas muelder (a.muelder@gmail.com)
 */
package scxml.generator;

import java.io.File;
import java.util.Arrays;
import org.eclipse.xtend2.lib.StringConcatenation;
import org.yakindu.sct.generator.core.ISGraphGenerator;
import org.yakindu.sct.model.sgen.GeneratorEntry;
import org.yakindu.sct.model.sgraph.Region;
import org.yakindu.sct.model.sgraph.State;
import org.yakindu.sct.model.sgraph.Statechart;
import org.yakindu.sct.model.sgraph.Transition;

@SuppressWarnings("all")
public class SCXMLGenerator implements ISGraphGenerator {
  public Object generate(final Statechart sc, final GeneratorEntry entry, final /* IFileSystemAccess */Object fsa) {
    throw new Error("Unresolved compilation problems:"
      + "\n+ cannot be resolved."
      + "\ngenerateFile cannot be resolved");
  }
  
  protected String _generate(final Statechart it) {
    throw new Error("Unresolved compilation problems:"
      + "\nThe method or field regions is undefined"
      + "\nThe method or field regions is undefined"
      + "\nhead cannot be resolved"
      + "\ninitialState cannot be resolved"
      + "\nhead cannot be resolved"
      + "\ngenerate cannot be resolved");
  }
  
  private String initialState(final Region region) {
    throw new Error("Unresolved compilation problems:"
      + "\nThe method or field vertices is undefined for the type Region"
      + "\nfilter cannot be resolved"
      + "\nhead cannot be resolved"
      + "\noutgoingTransitions cannot be resolved"
      + "\nhead cannot be resolved"
      + "\ntarget cannot be resolved"
      + "\nname cannot be resolved");
  }
  
  protected CharSequence _generate(final Region it) {
    throw new Error("Unresolved compilation problems:"
      + "\nThe method or field vertices is undefined"
      + "\nfilter cannot be resolved"
      + "\ngenerate cannot be resolved");
  }
  
  protected CharSequence _generate(final State it) {
    throw new Error("Unresolved compilation problems:"
      + "\nThe method or field outgoingTransitions is undefined"
      + "\ngenerate cannot be resolved");
  }
  
  protected CharSequence _generate(final Transition it) {
    StringConcatenation _builder = new StringConcatenation();
    _builder.append("<transition event=\"");
    String _specification = it.getSpecification();
    _builder.append(_specification);
    _builder.append("\" target=\"");
    String _name = it.getTarget().getName();
    _builder.append(_name);
    _builder.append("\"/>");
    _builder.newLineIfNotEmpty();
    return _builder;
  }
  
  public void write(final File dir, final String filename, final String content) {
    throw new Error("Unresolved compilation problems:"
      + "\n+ cannot be resolved."
      + "\n+ cannot be resolved");
  }
  
  public CharSequence generate(final Object it) {
    if (it instanceof State) {
      return _generate((State)it);
    } else if (it instanceof Region) {
      return _generate((Region)it);
    } else if (it instanceof Statechart) {
      return _generate((Statechart)it);
    } else if (it instanceof Transition) {
      return _generate((Transition)it);
    } else {
      throw new IllegalArgumentException("Unhandled parameter types: " +
        Arrays.<Object>asList(it).toString());
    }
  }
}
