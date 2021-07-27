/////////////////////////////////////////
install dependencies:

npm i @sap/cds @sap/cds-compiler @sap/cds-dk @sap/cds-foss @sap/cds-runtime express 
npm i -D sqlite3

/////////////////////////////////////////
Deployment to memory:
cds deploy --to sql
cds deploy --to sqlite

Deployment to persistent database:
cds deploy --to sqlite:/db/myBilling

/////////////////////////////////////////
Package.json

  "cds": {
    "requires": {
      "db": {
        "kind": "sql",
        "model": "*",
        "credentials": {
          "database": ":memory:"
        }
      }
    },
    "log": {
      "service": true
    },
    "features": {
      "preserve_computed": true
    }
  }
  
/////////////////////////////////////////  

npm i --save passport passport-google-oauth20 cookie-session



/////////////////////////////////////////  

const cds = require('@sap/cds')
module.exports = (req,res,next) => {
  req.user = new cds.User('Dummy')
  next()
}

{
	"auth": {
		"passport": {
			"strategy": "mock",
			"users": {
				"admin": {
					"password": "admin",
					"ID": "admin",
					"roles": [
						"authenticated-user"
					]
				}
			}
		}
	}
}