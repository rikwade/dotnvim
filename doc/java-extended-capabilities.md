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
inferSelectionSupport: List<?>
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
