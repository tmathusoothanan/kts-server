const Pool = require("pg").Pool;

const pool = new Pool({
    user:"postgres",
    password:"8855",
    host:"localhost",
    port:5433,
    database:"kts_1"
});

module.exports = pool;