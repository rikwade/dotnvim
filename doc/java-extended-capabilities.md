# Extended Capabilities

## Available extended capabilities

```
actionableNotificationSupported: boolean
actionableRuntimeNotificationSupport: boolean
advancedExtractRefactoringSupport: boolean
advancedGenerateAccessorsSupport: boolean
advancedIntroduceParameterRefactoringSupport: boolean
advancedOrganizeImportsSupport: boolean
classFileContentsSupport: boolean
clientDocumentSymbolProvider: boolean
clientHoverProvider: boolean
generateConstructorsPromptSupport: boolean
generateDelegateMethodsPromptSupport: boolean
generateToStringPromptSupport: boolean
gradleChecksumWrapperPromptSupport: boolean
hashCodeEqualsPromptSupport: boolean
moveRefactoringSupport: boolean
overrideMethodsPromptSupport: boolean
progressReportProvider: boolean
resolveAdditionalTextEditsSupport: boolean
shouldLanguageServerExitOnShutdown: boolean
inferSelectionSupport: List<?>
```

## How to pass to JDTLS

```lua
lsp.jdtls.setup({
    init_options = {
        extendedClientCapabilities = {
            classFileContentsSupport = true
        }
    }
})
```

## Response from the server for java std lib class

```
{ {
    range = {
      end = {
        character = 26,
        line = 3
      },
      start = {
        character = 19,
        line = 3
      }
    },
    uri = "jdt://contents/java.base/java.lang/Integer.class?=demo/%5C/usr%5C/lib%5C/jvm%5C/java-18-openjdk%5C/lib%5C/jrt-fs.jar%60java.base=/javadoc_location=/https:%5C/%5C/docs
.oracle.com%5C/en%5C/java%5C/javase%5C/18%5C/docs%5C/api%5C/=/%3Cjava.lang(Integer.class"
  } }
{
  bufnr = 1,
  client_id = 1,
  method = "textDocument/definition",
  params = {
    position = {
      character = 23,
      line = 25
    },
    textDocument = {
      uri = "file:///home/s1n7ax/Workspace/demo/src/main/java/com/example/demo/Solution.java"
    }
  }
}
```
