<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Default Captcha Configuration
    |--------------------------------------------------------------------------
    */
    'default' => [
        'length' => 4, // number of characters
        'width' => 120,
        'height' => 40,
        'quality' => 90,

        // fonts (put fonts inside public/fonts or storage/fonts)
        'fonts' => [
            base_path('public/fonts/arial.ttf'),
            base_path('public/fonts/times.ttf'),
        ],

        // background color (light grey)
        'bgColor' => [240, 245, 250],

        // text colors (random pick for each char)
        'colors' => [
            [255, 69, 0],    // orange-red
            [255, 140, 0],   // orange
            [0, 128, 255],   // blue
            [128, 0, 128],   // purple
            [34, 139, 34],   // green
            [220, 20, 60],   // crimson
        ],

        'contrast' => -5,
        'angle' => 20,   // rotation allowed

        // noise & lines
        'sharpen' => 10,
        'blur' => 0,
        'invert' => false,
        'lines' => 4,   // draw lines
        'bgImage' => false,
        'quality' => 90,
    ],

    /*
    |--------------------------------------------------------------------------
    | Alternative Styles (optional)
    |--------------------------------------------------------------------------
    */
    'flat' => [
        'length' => 5,
        'width' => 120,
        'height' => 40,
        'quality' => 90,
        'bgColor' => [255, 255, 255],
        'colors' => [
            [255, 0, 0],
            [0, 0, 255],
            [0, 128, 0],
            [128, 0, 128],
        ],
        'contrast' => -5,
        'angle' => 20,
        'lines' => 2,
    ],

    'mini' => [
        'length' => 3,
        'width' => 60,
        'height' => 32,
    ],

    'inverse' => [
        'length' => 5,
        'width' => 120,
        'height' => 36,
        'bgColor' => [0, 0, 0],
        'colors' => [
            [255, 255, 255],
            [200, 200, 200],
        ],
    ],
];
