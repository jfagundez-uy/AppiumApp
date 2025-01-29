package com.example;

import io.appium.java_client.AppiumDriver;
import io.appium.java_client.MobileElement;
import io.appium.java_client.ios.IOSDriver;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;

import java.net.MalformedURLException;
import java.net.URL;

public class AppiumTest {
    private AppiumDriver<MobileElement> driver;

    @BeforeClass
    public void setUp() throws MalformedURLException {
        DesiredCapabilities caps = new DesiredCapabilities();
        caps.setCapability("platformName", "iOS");
        caps.setCapability("platformVersion", "14.4");
        caps.setCapability("deviceName", "iPhone Simulator");

        driver = new IOSDriver<>(new URL("http://127.0.0.1:4723/wd/hub"), caps);
    }

    @Test
    public void testNavigation() {
        MobileElement formButton = driver.findElementByAccessibilityId("goToFormButton");
        formButton.click();
        MobileElement nameField = driver.findElementByAccessibilityId("nameField");
        nameField.sendKeys("John Doe");
        MobileElement emailField = driver.findElementByAccessibilityId("emailField");
        emailField.sendKeys("john@example.com");
        MobileElement submitButton = driver.findElementByAccessibilityId("submitButton");
        submitButton.click();
        driver.switchTo().alert().accept();

        driver.navigate().back();

        MobileElement listButton = driver.findElementByAccessibilityId("goToListButton");
        listButton.click();
        MobileElement listItem = driver.findElementByAccessibilityId("Item 1");
        assert listItem.getText().equals("Item 1");
    }

    @AfterClass
    public void tearDown() {
        if (driver != null) {
            driver.quit();
        }
    }
}
