extern "C" {
#include "src/calculator.h"
}
#include "gtest/gtest.h"

TEST(Calculator, addition) {
    EXPECT_EQ(9,add(8,1));
}