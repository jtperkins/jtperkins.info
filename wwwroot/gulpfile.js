/// <binding Clean='clean' />

// Sass configuration
var gulp = require('gulp');
var sass = require('gulp-sass');

//const paths = {
  //webroot: "./wwwroot/css/**/*.css"
//};

gulp.task('sass', function(cb) {
    gulp.src('./scss/**/*.scss')
        .pipe(sass())
        .pipe(gulp.dest(function(f) {
            return f.base;
        }));
    cb();
});

gulp.task('default', gulp.series('sass', function(cb) {
    gulp.watch('*.scss', gulp.series('sass'));
    cb();
}));