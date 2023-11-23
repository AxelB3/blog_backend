var express = require('express');
var router = express.Router();
const posts = require('../controllers/posts.controller');

router.get('/posts', posts.getPosts);
router.post('/crear_post', posts.createPost);
router.patch('/delete_post/:id', posts.deletePost);

module.exports = router;
