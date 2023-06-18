const multer = require('multer');

const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, 'uploads/');
    },
    filename: (req, file, cb) => {
        const uniqueSuffix = Date.now();
        const filename = file.originalname.replace(/ /g, "_");
        cb(null, uniqueSuffix + '-' + filename);
    }
});

const upload = multer({ storage });

const fileUploaderMiddleware = (req, res, next) => {

    upload.single('file')(req, res, err => {
        if (err) {
            return res.status(400).json({ success: false, message: 'File upload failed' });
        }

        if (!req.file) {
            return res.status(400).json({ success: false, message: 'No file uploaded' });
        }
        // console.log(req.file);
        // File uploaded successfully
        const fileUrl = `http://localhost:4000/uploads/${req.file.filename}`;
        req.fileUrl = fileUrl;
        next();
    });

};

module.exports = fileUploaderMiddleware;
