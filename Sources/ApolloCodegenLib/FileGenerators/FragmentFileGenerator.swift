import Foundation
import IR

/// Generates a file containing the Swift representation of a [GraphQL Fragment](https://spec.graphql.org/draft/#sec-Language.Fragments).
struct FragmentFileGenerator: FileGenerator {
  /// Source IR fragment.
  let irFragment: IR.NamedFragment
  /// The pattern matched options for this particular fragment source file.
  let patternMatchedOutputOptions: ApolloCodegenConfiguration.OutputOptions.PatternMatchedOutputOptions?
  /// Shared codegen configuration.
  let config: ApolloCodegen.ConfigurationContext

  var template: TemplateRenderer { FragmentTemplate(
    fragment: irFragment,
    patternMatchedOutputOptions: patternMatchedOutputOptions,
    config: config
  ) }
  var target: FileTarget { .fragment(irFragment.definition) }
  var fileName: String { irFragment.definition.name }
}
