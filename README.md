## Flutter Project Template

<div align="center">
  <picture>
    <img alt="Project Logo" src="assets/images/flutter_logo.svg" height="60%" width="60%">
  </picture>
</div>

<br>

<div align="center">

[![Tests](https://img.shields.io/github/actions/workflow/status/habedi/template-flutter-project/tests.yml?label=tests&style=flat&labelColor=333333&logo=github&logoColor=white)](https://github.com/habedi/template-flutter-project/actions/workflows/tests.yml)
[![Code Coverage](https://img.shields.io/codecov/c/github/habedi/template-flutter-project?style=flat&label=coverage&labelColor=333333&logo=codecov&logoColor=white)](https://codecov.io/gh/habedi/template-flutter-project)
[![Code Quality](https://img.shields.io/codefactor/grade/github/habedi/template-flutter-project?style=flat&label=code%20quality&labelColor=333333&logo=codefactor&logoColor=white)](https://www.codefactor.io/repository/github/habedi/template-flutter-project)
[![Flutter](https://img.shields.io/badge/Flutter-SDK-02569B?style=flat&labelColor=333333&logo=flutter&logoColor=white)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-SDK-0175C2?style=flat&labelColor=333333&logo=dart&logoColor=white)](https://dart.dev/)
[![Documentation](https://img.shields.io/badge/docs-latest-8ca0d7?style=flat&labelColor=333333&logo=read-the-docs&logoColor=white)](docs)
[![License](https://img.shields.io/badge/license-MIT-00acc1?style=flat&labelColor=333333&logo=open-source-initiative&logoColor=white)](LICENSE)
[![Makefile](https://img.shields.io/badge/managed%20with-Makefile-000000?style=flat&logo=gnu&labelColor=333333&logoColor=white)](https://www.gnu.org/software/make/)

</div>

---

This is a template repository for creating new [Flutter](https://flutter.dev/) projects.
It includes a basic structure, a `Makefile` for common developmental tasks, and a set of GitHub Actions workflows for
running tests and analysis.

### Features

- **Makefile**: for managing common tasks like testing, linting, and formatting.
- **GitHub Actions**: for running tests and static analysis.
- **Strict Linting**: Configured with a strong set of analysis rules for high-quality code.
- **Scalable Architecture**: A pre-defined directory structure for building scalable apps.

### Prerequisites

- `Flutter SDK`: Installed system-wide, for example via `snap`.
- `GNU Make`
- `Python >=3.10` and `pip` for installing `pre-commit`.

### Usage

1.  Use the `Use this template` button on GitHub to create a new repository.
2.  Install project dependencies:
    ```shell
    make install
    ```
3.  Set up the Git hooks (optional but recommended):
    ```shell
    make setup-hooks
    ```
4.  Run `make help` to see all available commands.

---

### Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for details on how to make a contribution.

### License

This template is licensed under the MIT License ([LICENSE](LICENSE) or https://opensource.org/licenses/MIT)
