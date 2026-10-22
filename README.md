# Stephanie Wallace — Cloud Computing, DevOps, and AI

This repository organizes course assignments, shared framework contributions, validation evidence, and the **Cloud-Native Biometric Consent and Audit Platform** using a project layout modeled on `cloudmesh-ai/cloudmesh-ai-vm` and adapted to the course workflow.

## Repository Structure

```text
.
├── assignments/          Weekly course assignments and validation reports
├── benchmarks/           Benchmark documentation and links to accepted results
├── docs/                 Architecture, security, and contribution documentation
├── project/              Project report and presentation material
├── src/                  Project source-code package
├── tests/                Project tests
├── Makefile              Common development commands
├── pyproject.toml        Python project metadata
└── requirements.txt      Pinned or shared development requirements
```

## Current Project

**Cloud-Native Biometric Consent and Audit Platform**

The project implements the biometric-consent problem as a cloud systems exercise rather than repeating the earlier consent-model research. The current architecture separates public consent interactions from protected administrative and audit functions and uses synthetic data rather than real biometric information.

| Environment | Category | Role | Status |
| --- | --- | --- | --- |
| Multipass | Local | Development and repeatable testing | Validated |
| Jetstream 2 | OpenStack | Protected management and audit tier | Real-cloud workflows validated |
| Azure | Public cloud | Public-facing application tier | Selected; live validation remains outstanding |

The current detailed project report is available at [project/project.md](project/project.md).

## Shared Cloudmesh Contributions

Course work also includes contributions to the shared [cloudmesh-ai/cloudmesh-ai-vm](https://github.com/cloudmesh-ai/cloudmesh-ai-vm) framework.

| PR | Status | Contribution |
| --- | --- | --- |
| [#55](https://github.com/cloudmesh-ai/cloudmesh-ai-vm/pull/55) | Merged | Fixed smoke-test collection by adding the missing `Optional` import. |
| [#56](https://github.com/cloudmesh-ai/cloudmesh-ai-vm/pull/56) | Merged | Isolated provider-specific lifecycle smoke tests. |
| [#60](https://github.com/cloudmesh-ai/cloudmesh-ai-vm/pull/60) | Merged | Restored the OpenStack floating-IP helper. |
| [#65](https://github.com/cloudmesh-ai/cloudmesh-ai-vm/pull/65) | Closed as redundant | Investigated GitHub SSH-key normalization and verified the equivalent upstream implementation. |
| [#67](https://github.com/cloudmesh-ai/cloudmesh-ai-vm/pull/67) | Merged | Fixed noninteractive SSH private-key passphrase detection on Windows. |
| [#70](https://github.com/cloudmesh-ai/cloudmesh-ai-vm/pull/70) | Closed / relocated | Multipass benchmark evidence was moved to the dedicated results repository. |
| [Results PR #1](https://github.com/cloudmesh-ai/cloudmesh-ai-vm-results/pull/1) | Merged | Accepted Multipass CLI and lifecycle smoke-test results under `swallace6/smoke/`. |

A fuller contribution record is maintained in [docs/contributions.md](docs/contributions.md).

## Course Assignments

- [Week 1](assignments/week1/)
- [Week 2](assignments/week2/)
- [Week 3](assignments/week3/)
- [Week 4](assignments/week4/)
- [Week 5](assignments/week5/README.md)
- [Week 6](assignments/week6/README.md)
- [Week 7](assignments/week7/README.md)

The assignment index is available at [assignments/README.md](assignments/README.md).

## Project Documentation

- [Architecture](docs/architecture.md)
- [Security and Privacy](docs/security.md)
- [Shared Repository Contributions](docs/contributions.md)
- [Benchmark Evidence](benchmarks/README.md)
- [Project Report](project/project.md)

## Development Layout

The repository now follows the same broad software-project organization used by the shared Cloudmesh repository: source code under `src/`, tests under `tests/`, documentation under `docs/`, project metadata at the root, and assignment/project evidence separated into dedicated directories.

The source package is currently a lightweight project scaffold. Application services, API implementation, database integration, containerization, and Azure deployment will be added as the project implementation progresses.

## Current Priorities

1. Complete Azure provider validation against the current `cloudmesh-ai-vm` development branch.
2. Implement the first consent-service components under `src/`.
3. Add rule, API, revocation, and authorization tests under `tests/`.
4. Add project-specific benchmark evidence under `benchmarks/`.
5. Continue documenting security boundaries and deployment decisions under `docs/`.

## Security Note

No passwords, API tokens, private SSH keys, cloud credentials, or other secrets should be committed to this repository. The class prototype uses synthetic identifiers and simulated biometric events.
