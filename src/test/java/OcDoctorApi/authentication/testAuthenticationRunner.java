package OcDoctorApi.authentication;

import com.intuit.karate.junit5.Karate;

public class testAuthenticationRunner {
    @Karate.Test
    Karate testProd() {
        return Karate.run().karateEnv("prod").relativeTo(getClass());
    }

    @Karate.Test
    Karate testPreprod() {
        return Karate.run().karateEnv("preprod").relativeTo(getClass());
    }

    @Karate.Test
    Karate testWithoutEnv(){
        return Karate.run().relativeTo(getClass());
    }
}
