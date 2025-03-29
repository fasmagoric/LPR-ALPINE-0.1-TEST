# LEPORIDAE 0.1 - ALV (ALPINE LINUX VIRTUALIZATION) - TEST VERSION (unstable)

Leporidae 0.1 is certainly not an operating system; however, its endoskeleton and structure function as a resident system, an endosystem, that communicates directly with the kernel and the software’s lowest layers. Its primary distinction lies in its entire operational module being written in Ruby.

  The project is still in testing, but it is designed to run within a virtual machine integrated with Alpine Linux, with future versions potentially supporting microkernels or even a native monolithic kernel.

  Leporidae aims to be a compact and functional endosystem capable of running on external HDDs, SSDs, and similar devices, managing files and functionalities within these devices regardless of the host machine’s operating system. It encapsulates all processes within a secure and efficient virtualization environment, making it ideal for office environments or servers.

---

# SYSTEM DIRECTORY DIAGRAM

```
/lpr
├── @run
└── @usr
    ├── bin
    ├── krn
    │   └── lprk-0.1-ALV
    │       ├── Gemfile
    │       ├── Gemfile.lock
    │       ├── boot.rb
    │       ├── cmd.rb
    │       ├── main.rb
    │       └── recall.rb
    └── yml
        └── config.yaml
```
---
