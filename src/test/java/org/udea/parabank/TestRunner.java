package org.udea.parabank;

import com.intuit.karate.junit5.Karate;

class TestRunner {

    @Karate.Test
    Karate test01_AppContactLogin() {
        return Karate.run("login")
                .relativeTo(getClass())
                .outputCucumberJson(true);
    }

    @Karate.Test
    Karate test02_AppContactAdd() {
        return Karate.run("addContact")
                .relativeTo(getClass())
                .outputCucumberJson(true);
    }

}
