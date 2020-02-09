const animal = {};

const getHandler = function (req, res, next) {
    res.status(200).json({
        success: true,
        animal
    });
};

const postHandler = function (req, res, next) {
    const { name, type, hand } = req.body;
    if (!name || !type || !hand) {
        res.status(400).json({
            success: false,
            message: "Name or Type or Hand is require"
        });
        return;
    }

    if (animal[name]) {
        res.status(200).json({
            success: false,
            message: "Animal is live"
        });
        return;
    }

    animal[name] = {
        type,
        hand
    };

    res.status(200).json({
        success: true,
        message: "Create animal successfully"
    });
};

const putHandler = function (req, res, next) {
    const { name, type, hand } = req.body;
    if (!name || !type || !hand) {
        res.status(400).json({
            success: false,
            message: "Name or Type or Hand is require"
        });
        return;
    }
    const curAnimal = animal[name];
    if (!curAnimal) {
        res.status(400).json({
            success: false,
            message: "Animal not found"
        });
        return;
    }

    curAnimal.type = type;
    curAnimal.hand = hand;

    res.status(200).json({
        success: true,
        message: "Update successfully"
    });
};

const deleteHandler = function (req, res, next) {
    const { name } = req.body;
    if (!name) {
        res.status(400).json({
            success: false,
            message: "Name is require"
        });
        return;
    }

    if (!animal[name]) {
        res.status(400).json({
            success: false,
            message: "Animal not found"
        });
        return;
    }
    delete animal[name];
    res.status(200).json({
        success: true,
        message: "Animal is deleted"
    });
};

module.exports = {
    getHandler,
    postHandler,
    putHandler,
    deleteHandler
};