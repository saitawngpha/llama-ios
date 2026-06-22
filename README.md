# Llama-iOS

Prebuilt iOS XCFramework for llama.cpp with Swift Package Manager support.

This repository automatically builds the latest version of llama.cpp into an XCFramework for Apple platforms and publishes it through GitHub Releases.

## Features

* ✅ Prebuilt llama.cpp XCFramework
* ✅ Swift Package Manager support
* ✅ iOS Device (arm64)
* ✅ iOS Simulator (arm64, x86_64)
* ✅ Metal acceleration support
* ✅ Automatic GitHub Actions release pipeline
* ✅ Built directly from upstream llama.cpp source

## Installation

### Swift Package Manager

In Xcode:

1. Open your project.
2. Select **File → Add Package Dependencies**.
3. Enter:

```text
https://github.com/saitawngpha/llama-ios
```

4. Choose the desired version.
5. Add the package to your target.

## Usage

Import the framework:

```swift
import LlamaCpp
```

### Example

```swift
import Foundation
import LlamaCpp

// Initialize llama backend
llama_backend_init()

defer {
    llama_backend_free()
}

// Load model
let modelPath = Bundle.main.path(
    forResource: "model",
    ofType: "gguf"
)!

var params = llama_model_default_params()

let model = llama_model_load_from_file(
    modelPath,
    params
)

guard model != nil else {
    fatalError("Failed to load model")
}

print("Model loaded successfully")
```

## Downloading Models

Compatible GGUF models can be obtained from:

* Hugging Face
* TheBloke releases
* GGUF community models

Example:

```text
Llama-3-8B-Instruct.Q4_K_M.gguf
```

Add the model to your application bundle or download it at runtime.

## Building New Releases

This repository includes a GitHub Actions workflow that:

1. Checks out llama.cpp
2. Builds the XCFramework using:

```bash
./build-xcframework.sh
```

3. Packages the framework
4. Generates Swift Package checksum
5. Updates Package.swift
6. Creates a GitHub Release

### Manual Release

Navigate to:

```text
Actions → Release → Run Workflow
```

Parameters:

| Parameter | Example |
| --------- | ------- |
| version   | v0.1.0  |
| tag       | b5558   |

Example:

```text
version: v0.1.0
tag: b5558
```

## Updating llama.cpp

To build a newer version:

1. Find the desired upstream tag or commit.
2. Run the release workflow.
3. Enter the tag/commit hash.
4. A new GitHub Release will be published automatically.

## Supported Platforms

| Platform  | Architecture |
| --------- | ------------ |
| iPhone    | arm64        |
| iPad      | arm64        |
| Simulator | arm64        |
| Simulator | x86_64       |

Minimum deployment target:

```text
iOS 15.0
```

## Credits

* llama.cpp by ggml-org
* GGML
* Apple Swift Package Manager

## License

This repository distributes binaries built from llama.cpp.

Please refer to the upstream llama.cpp license for details.
