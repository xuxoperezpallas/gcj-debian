#include <gtest/gtest.h>

// Example test
TEST(SampleTest, TestExample) {
    EXPECT_EQ(1, 1);  // Test that 1 is equal to 1
}

int main(int argc, char **argv) {
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}
