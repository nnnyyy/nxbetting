/**
 * Created by nnnyyy on 2018-04-12.
 */
exports.logger = function(req, res, next) {
    console.log(req.session);
    next();
}