from conans import ConanFile, CMake


class ExampleC(ConanFile):
    name = "example"
    version = "0.1.0"
    license = "closed"
    url = "TODO"
    description = "this is a simple c example"
    channel = "development"
    user = "michel"
    settings = "os", "compiler", "build_type",
    generators = "cmake","virtualenv"
    exports_sources = "src/*", "test/*", "CMakeLists.txt"

    def build_requirements(self):
        self.build_requires("gtest/cci.20210126 ", force_host_context=True)

    def build(self):
        cmake = CMake(self)
        cmake.configure()
        cmake.build()
        cmake.test()

