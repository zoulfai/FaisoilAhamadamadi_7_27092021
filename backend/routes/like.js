//route like
const express = require("express");
const router = express.Router();
const likeCtrl = require("../controllers/like");
const auth = require("../middleware/auth");

// les requêtes
router.post("/",likeCtrl.like);
router.post("/liked",likeCtrl.liked);


module.exports = router;