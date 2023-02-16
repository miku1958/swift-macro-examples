//
//  ClassConformingToProtocolMacro.swift
//  MacroExamplesPlugin
//
//  Created by taozhuang on 2023/2/16.
//

import SwiftSyntax
import SwiftSyntaxMacros

public struct ClassConformingToProtocolMacro: ExpressionMacro {
  public static func expansion(
	of node: some FreestandingMacroExpansionSyntax,
	in context: some MacroExpansionContext
  ) -> ExprSyntax {
	guard let argument = node.argumentList.first?.expression else {
	  fatalError("compiler bug: the macro does not have any arguments")
	}

	guard let type = argument.as(MemberAccessExprSyntax.self)?.base else {
	  fatalError("compiler bug: arguments doesn't provide any type")
	}

	return "classConforming(to: \(argument)) as? \(type).Type"
  }
}
