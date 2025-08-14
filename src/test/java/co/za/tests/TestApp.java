package co.za.tests;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
import static co.za.application.App.*; 

public class TestApp {

    @Test
    public void testExample() {
        assertTrue(true, "This is a simple test that should always pass.");
    }

    @Test
    public void testAddition() {
        assertEquals(5, add(2, 3), "2 + 3 should equal 5");
    }

    @Test
    public void testSubtraction() {
        assertEquals(1, subtract(3, 2), "3 - 2 should equal 1");
    }

    @Test
    public void testProduct() {
        assertEquals(6, product(2, 3), "2 * 3 should equal 6");
    }

}
