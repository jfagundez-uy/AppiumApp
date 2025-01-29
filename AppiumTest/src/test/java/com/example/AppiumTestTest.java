package com.example;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

public class AppiumTestTest
    extends TestCase
{
    /**
     * Create the test case
     *
     * @param testName name of the test case
     */
    public AppiumTestTest(String testName )
    {
        super( testName );
    }

    public static Test suite()
    {
        return new TestSuite( AppiumTestTest.class );
    }

    public void testApp()
    {
        assertTrue( true );
    }
}
