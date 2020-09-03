import Foundation
import enum TSCBasic.ProcessEnv
import TuistAsyncQueue
import enum TuistSupport.LogOutput

if CommandLine.arguments.contains("--verbose") { try? ProcessEnv.setVar("TUIST_VERBOSE", value: "true") }

LogOutput.bootstrap()

import TuistKit

try AsyncQueue.run {
    TuistCommand.main()
}
