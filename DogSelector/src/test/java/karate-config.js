function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    myVarName: 'someValue',
    TOKEN_KEY: 'fc29df39-a579-4634-8dde-a1cad4351449',
    BASE_URL: 'https://api.thedogapi.com/',
    PATH_BREED: 'v1/breeds/',
    PATH_VOTE: 'v1/votes/'
  }
  if (env == 'dev') {

    // customize
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
    // customize
  }
  return config;
}

