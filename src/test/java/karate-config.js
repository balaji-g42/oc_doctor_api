function fn() {
    var env = karate.env;
    karate.log('karate.env system property was:', env);
    if(!env) {
        env = 'stg';
    }
    var config = {
            env:env,
            baseUrlCme : 'https://stgapi.omnicuris.com',
            baseUrlMed : 'https://stg-medshots-api.omnicuris.com',
            country : 'IN',
            mobile : '6565055127'
        };
    if(env == 'prod') {
        config.baseUrlCme = 'https://api.omnicuris.com';
        config.baseUrlMed = 'https://medshots-api.omnicuris.com';
    } else if (env == 'preprod') {
        config.baseUrlCme = 'https://preprodapi.omnicuris.com';
        config.baseUrlMed = 'https://preprod-medshots-api.omnicuris.com';
    }
    var result = karate.callSingle('classpath:OcDoctorApi/common/common.feature@country',config);
    karate.configure('headers', { Accept: 'application/json' });
    config.country = result.country;
    return config;
}