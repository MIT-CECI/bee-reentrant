require 'rubygems'
require 'pusher'
require 'dotenv'

Dotenv.load

Pusher.app_id = ENV['PUSHER_APP']
Pusher.key = ENV['PUSHER_KEY']
Pusher.secret = ENV['PUSHER_SECRET']


def array_matrix
  [
    [1397, '2010-06-11T01:01:00.0000000Z',20.407,23.599,23.912,21.498,21.371,21.064,20.526,29.95,29.797,19.894,19.774,19.811,19.787,21.932,20.694,22.006,22.039,21.429,21.67,-99999,20.842,19.98,19.622,19.733,19.235,20.181,21.31,-99999,24.569,24.422,23.113,23.06,24.5,23.305,24.777,24.809,24.715,21.76,21.67,21.338,24.447,23.995,22.938,24.585,23.354,24.182,23.195,24.304,25.334,24.467,18.86,19.309,18.79,24.466,24.677,23.132,23.161,24.918,22.989,25.56,25.267,25.584,21.34,21.869,21.668,24.572,24.172,23.042,26.619,23.467,24.913,23.512,25.223,25.239,25.296,18.892,18.859,19.184,0,4.2],

    [1398, '2010-06-11T01:02:00.0000000Z',20.419,23.589,23.898,20.874,20.677,20.23,19.831,29.087,28.045,19.889,19.765,19.872,19.778,21.161,20.657,21.682,21.837,21.456,21.526,-99999,20.854,19.983,19.625,19.737,19.255,20.193,21.305,-99999,24.558,24.412,23.111,23.037,24.465,23.319,24.786,24.79,24.701,21.761,21.667,21.356,24.432,23.992,22.927,24.579,23.352,24.172,23.184,24.294,25.319,24.449,18.862,19.315,18.796,24.452,24.664,23.127,23.159,24.888,23,25.579,25.274,25.538,21.339,21.859,21.654,24.554,24.163,23.025,26.602,23.461,24.892,23.498,25.213,25.229,25.29,18.894,18.865,19.191,0,4.2],

    [1399, '2010-06-11T01:03:00.0000000Z',20.419,23.58,23.886,20.529,20.378,19.699,19.288,27.928,26.612,19.975,19.774,19.827,19.769,20.866,20.554,21.399,21.592,21.362,21.235,-99999,20.858,19.983,19.634,19.741,19.263,20.197,21.325,-99999,24.562,24.403,23.111,23.041,24.469,23.307,24.766,24.778,24.693,21.786,21.667,21.331,24.432,23.988,22.919,24.57,23.343,24.163,23.172,24.289,25.295,24.44,18.874,19.331,18.804,24.441,24.66,23.132,23.156,24.892,22.964,25.584,25.267,25.539,21.332,21.86,21.663,24.538,24.159,23.038,26.59,23.45,24.888,23.491,25.206,25.218,25.291,18.903,18.879,19.208,0,4.2],

    [1400, '2010-06-11T01:04:00.0000000Z',20.414,23.565,23.873,20.324,19.95,19.461,19.008,27.155,25.927,19.983,19.761,19.835,19.786,20.673,20.505,21.247,21.415,21.05,20.96,-99999,20.854,19.987,19.634,19.745,19.284,20.209,21.333,-99999,24.539,24.397,23.104,23.022,24.47,23.292,24.755,24.763,24.678,21.787,21.66,21.365,24.405,23.973,22.92,24.556,23.337,24.148,23.157,24.283,25.26,24.434,18.871,19.324,18.81,24.427,24.651,23.114,23.138,24.862,22.979,25.537,25.237,25.529,21.334,21.85,21.67,24.529,24.154,23.024,26.572,23.449,24.879,23.485,25.196,25.204,25.281,18.906,18.889,19.198,0,4.1],

    [1401, '2010-06-11T01:05:00.0000000Z',20.407,23.555,23.863,20.181,19.951,19.495,19.165,27.666,27.302,19.922,19.799,19.799,19.774,20.612,20.456,21.096,21.388,20.953,20.945,-99999,20.863,19.996,19.651,19.754,19.285,20.218,21.347,-99999,24.529,24.378,23.073,23.028,24.46,23.277,24.737,24.745,24.667,21.76,21.65,21.334,24.407,23.963,22.922,24.545,23.326,24.142,23.147,24.26,25.237,24.419,18.877,19.334,18.811,24.43,24.641,23.117,23.137,24.857,22.974,25.556,25.227,25.516,21.333,21.849,21.657,24.519,24.149,23.006,26.555,23.447,24.873,23.48,25.191,25.195,25.272,18.925,18.9,19.213,0,4.2],

    [1402, '2010-06-11T01:06:00.0000000Z',20.392,23.544,23.85,20.211,19.952,19.631,19.265,28.346,28.087,20.026,19.75,19.829,19.816,20.564,20.474,21.04,21.343,21.056,21.007,-99999,20.868,19.993,19.639,19.755,19.302,20.231,21.347,-99999,24.522,24.36,23.079,23.01,24.453,23.279,24.726,24.738,24.669,21.795,21.66,21.336,24.392,23.952,22.903,24.531,23.324,24.127,23.144,24.262,25.218,24.413,18.887,19.336,18.821,24.412,24.632,23.099,23.132,24.84,22.936,25.535,25.222,25.519,21.332,21.852,21.659,24.514,24.119,23.013,26.542,23.434,24.86,23.466,25.177,25.181,25.267,18.928,18.912,19.22,0,4.2],

    [1403, '2010-06-11T01:07:00.0000000Z',20.375,23.532,23.837,20.243,19.993,19.746,19.388,28.455,28.135,19.988,19.766,19.783,19.803,20.572,20.412,21.003,21.216,21.085,21.052,-99999,20.859,19.993,19.639,19.758,19.31,20.227,21.347,-99999,24.506,24.351,23.062,22.993,24.408,23.258,24.713,24.718,24.644,21.758,21.647,21.336,24.351,23.935,22.887,24.522,23.307,24.115,23.128,24.249,25.194,24.392,18.891,19.344,18.833,24.383,24.615,23.082,23.131,24.835,22.939,25.514,25.201,25.49,21.319,21.839,21.659,24.501,24.118,23.009,26.529,23.429,24.847,23.458,25.164,25.168,25.246,18.932,18.911,19.224,0,4.1],

    [1404, '2010-06-11T01:08:00.0000000Z',20.362,23.526,23.824,20.325,20.12,19.89,19.548,28.458,28.164,20.042,19.762,19.82,19.791,20.613,20.477,21.011,21.343,21.084,21.281,-99999,20.863,20.001,19.651,19.758,19.322,20.231,21.343,-99999,24.504,24.349,23.06,22.999,24.398,23.26,24.703,24.695,24.638,21.768,21.657,21.334,24.361,23.929,22.864,24.52,23.309,24.109,23.117,24.239,25.179,24.398,18.905,19.358,18.835,24.379,24.607,23.082,23.106,24.822,22.947,25.485,25.176,25.477,21.322,21.826,21.654,24.497,24.106,23,26.492,23.429,24.843,23.453,25.152,25.144,25.233,18.939,18.915,19.24,0,4.2],

    [1405, '2010-06-11T01:09:00.0000000Z',20.343,23.513,23.814,20.512,20.413,20.175,19.887,28.464,28.181,20.076,19.776,19.838,19.788,20.643,20.462,21.041,21.262,21.115,21.27,-99999,20.856,19.998,19.645,19.747,19.32,20.224,21.336,-99999,24.479,24.32,23.047,22.986,24.401,23.247,24.67,24.674,24.613,21.743,21.645,21.329,24.348,23.917,22.859,24.503,23.296,24.096,23.105,24.222,25.154,24.381,18.909,19.358,18.851,24.36,24.596,23.096,23.108,24.804,22.912,25.507,25.17,25.442,21.333,21.841,21.648,24.486,24.091,22.982,26.47,23.418,24.824,23.443,25.146,25.129,25.223,18.954,18.929,19.242,0,4.2],

    [1406, '2010-06-11T01:11:00.0000000Z',20.325,23.496,23.791,20.99,20.789,20.674,20.408,28.394,28.063,20.071,19.775,19.795,19.775,21.039,20.605,21.302,21.404,21.187,21.31,-99999,20.851,19.988,19.631,19.746,19.322,20.223,21.306,-99999,24.458,24.311,23.031,22.982,24.372,23.227,24.686,24.653,24.596,21.738,21.624,21.341,24.336,23.9,22.879,24.486,23.284,24.083,23.092,24.214,25.113,24.364,18.925,19.378,18.855,24.345,24.565,23.052,23.081,24.781,22.918,25.456,25.147,25.432,21.318,21.817,21.649,24.451,24.064,22.962,26.426,23.395,24.805,23.42,25.114,25.098,25.196,18.951,18.939,19.252,0,4.2],

    [1407, '2010-06-11T01:12:00.0000000Z',20.319,23.483,23.778,21.136,21.021,20.873,20.668,28.432,28.069,20.056,19.723,19.822,19.715,21.259,20.643,21.41,21.533,21.201,21.062,-99999,20.845,19.982,19.637,19.744,19.324,20.212,21.292,-99999,24.433,24.315,23.047,22.977,24.372,23.21,24.645,24.641,24.576,21.717,21.627,21.328,24.331,23.875,22.846,24.478,23.271,24.067,23.087,24.189,25.088,24.34,18.925,19.377,18.863,24.337,24.557,23.08,23.072,24.768,22.901,25.443,25.126,25.403,21.317,21.805,21.633,24.434,24.047,22.958,26.406,23.387,24.797,23.407,25.11,25.086,25.183,18.955,18.946,19.255,0,4.2],

    [1408, '2010-06-11T01:13:00.0000000Z',20.317,23.471,23.766,21.343,21.232,21.027,20.863,28.362,28.067,20.021,19.746,19.82,19.738,21.392,20.645,21.523,21.601,21.027,21.105,-99999,20.842,19.98,19.635,19.742,19.326,20.214,21.285,-99999,24.421,24.286,23.018,22.969,24.36,23.197,24.64,24.624,24.563,21.725,21.627,21.332,24.302,23.87,22.834,24.474,23.267,24.058,23.079,24.184,25.06,24.323,18.928,19.377,18.875,24.312,24.544,23.072,23.068,24.743,22.904,25.435,25.105,25.378,21.312,21.788,21.628,24.426,24.035,22.953,26.377,23.378,24.776,23.402,25.081,25.073,25.162,18.962,18.954,19.259,0,4.1],

    [1409, '2010-06-11T01:14:00.0000000Z',20.318,23.46,23.755,21.459,21.467,21.159,20.536,28.371,28.036,19.932,19.759,19.821,19.722,21.577,20.638,21.618,21.708,20.995,21.213,-99999,20.844,19.989,19.632,19.743,19.327,20.207,21.274,-99999,24.406,24.255,22.999,22.95,24.329,23.199,24.642,24.598,24.549,21.719,21.625,21.338,24.3,23.86,22.836,24.455,23.26,24.048,23.064,24.178,25.037,24.321,18.93,19.395,18.876,24.334,24.525,23.073,23.041,24.745,22.914,25.428,25.099,25.396,21.318,21.789,21.63,24.407,24.036,22.943,26.362,23.372,24.782,23.396,25.071,25.058,25.16,18.968,18.96,19.269,0,4.2],

    [1410, '2010-06-11T01:15:00.0000000Z',20.32,23.452,23.744,21.584,21.539,21.293,20.452,28.329,28.025,19.983,19.765,19.807,19.72,21.653,20.624,21.735,21.747,21.067,21.153,-99999,20.846,19.979,19.626,19.741,19.338,20.205,21.272,-99999,24.41,24.255,22.986,22.962,24.324,23.178,24.626,24.593,24.544,21.714,21.624,21.362,24.267,23.852,22.815,24.451,23.256,24.035,23.056,24.17,25.025,24.316,18.946,19.395,18.884,24.306,24.526,23.078,23.034,24.726,22.874,25.425,25.092,25.38,21.319,21.766,21.627,24.404,24.017,22.931,26.335,23.364,24.762,23.377,25.067,25.051,25.153,18.977,18.965,19.274,0,4.2],

    [1411, '2010-06-11T01:16:00.0000000Z',20.324,23.439,23.731,21.571,21.678,21.334,20.604,28.292,28.013,19.922,19.757,19.807,19.724,21.776,20.636,21.747,21.829,21.055,21.215,-99999,20.842,19.987,19.63,19.745,19.338,20.209,21.272,-99999,24.377,24.234,23.002,22.945,24.324,23.174,24.625,24.576,24.54,21.706,21.612,21.362,24.251,23.839,22.798,24.438,23.239,24.022,23.039,24.149,24.996,24.3,18.95,19.39,18.896,24.302,24.505,23.045,23.017,24.709,22.898,25.408,25.083,25.368,21.315,21.769,21.618,24.395,24.012,22.931,26.306,23.364,24.754,23.368,25.051,25.03,25.144,18.981,18.969,19.277,0,4.2],

    [1412, '2010-06-11T01:17:00.0000000Z',20.328,23.433,23.72,21.66,21.746,21.415,20.681,28.283,27.996,19.954,19.732,19.834,19.748,21.91,20.635,21.792,21.841,21.12,21.222,-99999,20.841,19.974,19.621,19.732,19.345,20.204,21.263,-99999,24.371,24.236,23.004,22.943,24.322,23.18,24.627,24.57,24.517,21.72,21.613,21.368,24.281,23.833,22.829,24.428,23.237,24.016,23.037,24.147,24.981,24.281,18.96,19.409,18.911,24.275,24.495,23.03,23.014,24.69,22.888,25.402,25.072,25.39,21.304,21.746,21.623,24.376,24.002,22.924,26.287,23.353,24.743,23.361,25.044,25.028,25.138,18.987,18.978,19.279,0,4.1],

    [1413, '2010-06-11T01:18:00.0000000Z',20.334,23.42,23.708,21.695,21.859,21.474,20.629,28.253,27.938,20.001,19.717,19.837,19.701,21.904,20.662,21.835,21.88,21.179,21.257,-99999,20.843,19.989,19.627,19.734,19.351,20.211,21.253,-99999,24.354,24.236,22.983,22.943,24.305,23.155,24.606,24.562,24.505,21.703,21.601,21.375,24.256,23.824,22.796,24.419,23.228,24.004,23.032,24.126,24.952,24.277,18.968,19.417,18.902,24.275,24.482,23.03,23.018,24.67,22.867,25.381,25.048,25.333,21.3,21.742,21.615,24.364,23.993,22.916,26.263,23.345,24.726,23.349,25.028,25.015,25.125,19.003,18.982,19.295,0,4.2],

    [1414, '2010-06-11T01:19:00.0000000Z',20.339,23.414,23.698,21.746,21.873,21.533,20.52,28.153,27.821,19.961,19.735,19.817,19.723,21.918,20.663,21.832,21.823,21.217,21.348,-99999,20.84,19.986,19.62,19.727,19.361,20.203,21.246,-99999,24.348,24.217,22.997,22.932,24.299,23.165,24.58,24.535,24.486,21.709,21.599,21.369,24.238,23.797,22.81,24.421,23.222,24.001,23.022,24.132,24.942,24.27,18.974,19.423,18.916,24.269,24.481,23.029,23.008,24.668,22.87,25.343,25.055,25.327,21.298,21.712,21.609,24.367,23.975,22.91,26.249,23.347,24.725,23.343,25.006,25.002,25.111,18.993,19.001,19.298,0,4.2],

    [1415, '2010-06-11T01:21:00.0000000Z',20.355,23.393,23.677,21.835,21.978,21.524,20.523,28.213,27.954,19.932,19.71,19.738,19.722,22.027,20.687,21.88,21.823,21.221,21.29,-99999,20.839,19.981,19.631,19.742,19.372,20.207,21.249,-99999,24.31,24.213,22.96,22.915,24.261,23.14,24.538,24.522,24.494,21.709,21.598,21.369,24.217,23.789,22.793,24.396,23.209,23.98,23.009,24.111,24.897,24.249,18.986,19.43,18.924,24.24,24.448,23.032,22.992,24.643,22.845,25.363,25.038,25.318,21.306,21.74,21.605,24.342,23.963,22.902,26.204,23.335,24.708,23.331,24.985,24.977,25.095,19.009,19.013,19.306,0,4.2],

    [1416, '2010-06-11T01:22:00.0000000Z',20.362,23.383,23.665,21.892,21.937,21.527,20.563,28.228,27.949,20.025,19.725,19.799,19.721,22.08,20.695,21.892,21.797,21.154,21.298,-99999,20.842,19.988,19.626,19.737,19.371,20.21,21.248,-99999,24.292,24.186,22.954,22.913,24.28,23.137,24.548,24.491,24.475,21.694,21.591,21.383,24.222,23.774,22.782,24.389,23.199,23.966,22.995,24.1,24.882,24.231,18.992,19.432,18.934,24.231,24.443,23.007,22.967,24.643,22.86,25.363,25.009,25.31,21.305,21.78,21.58,24.321,23.946,22.909,26.175,23.322,24.691,23.318,24.976,24.964,25.09,19.017,19.017,19.309,0,4.2],

    [1417, '2010-06-11T01:23:00.0000000Z',20.367,23.372,23.659,21.438,21.184,20.954,20.449,28.185,27.959,20.002,19.734,19.821,19.726,21.848,20.655,21.901,21.893,21.258,21.315,-99999,20.835,19.977,19.628,19.734,19.372,20.215,21.241,-99999,24.289,24.175,22.947,22.89,24.261,23.135,24.546,24.481,24.448,21.675,21.589,21.384,24.196,23.764,22.784,24.367,23.196,23.959,22.984,24.082,24.859,24.228,18.993,19.442,18.936,24.209,24.433,23.018,22.965,24.62,22.858,25.336,25.023,25.279,21.295,21.787,21.594,24.319,23.948,22.887,26.161,23.32,24.681,23.308,24.974,24.962,25.088,19.023,19.023,19.324,0,4.1],

    [1418, '2010-06-11T01:24:00.0000000Z',20.375,23.361,23.648,20.711,20.444,20.132,19.655,28.229,27.95,19.988,19.705,19.84,19.734,21.068,20.609,21.576,21.744,21.269,21.367,-99999,20.834,19.984,19.631,19.734,19.376,20.21,21.24,-99999,24.267,24.169,22.929,22.884,24.25,23.116,24.54,24.458,24.442,21.706,21.587,21.378,24.177,23.745,22.794,24.368,23.182,23.941,22.978,24.083,24.837,24.214,18.999,19.44,18.946,24.211,24.435,23.019,22.97,24.618,22.848,25.326,25.025,25.273,21.309,21.772,21.592,24.316,23.929,22.876,26.146,23.317,24.679,23.309,24.976,24.956,25.074,19.033,19.041,19.329,0,4.2],

    [1419, '2010-06-11T01:25:00.0000000Z',20.376,23.349,23.635,20.38,20.137,19.677,19.348,28.177,27.931,19.961,19.722,19.759,19.739,20.786,20.45,21.254,21.467,21.291,21.336,-99999,20.844,19.981,19.632,19.743,19.389,20.224,21.25,-99999,24.266,24.156,22.924,22.875,24.25,23.112,24.515,24.454,24.425,21.689,21.566,21.365,24.169,23.741,22.777,24.352,23.181,23.928,22.965,24.071,24.824,24.201,19.007,19.443,18.958,24.206,24.418,23.003,22.954,24.601,22.819,25.321,24.98,25.244,21.296,21.788,21.587,24.296,23.925,22.876,26.126,23.309,24.662,23.301,24.963,24.951,25.061,19.041,19.045,19.337,0,4.2],

    [1420, '2010-06-11T01:26:00.0000000Z',20.375,23.347,23.624,20.309,20.021,19.795,19.404,28.156,27.97,19.91,19.75,19.766,19.754,20.666,20.457,21.105,21.396,21.261,21.392,-99999,20.847,19.988,19.635,19.75,19.4,20.239,21.265,-99999,24.252,24.142,22.93,22.877,24.223,23.102,24.509,24.46,24.403,21.674,21.584,21.396,24.166,23.734,22.783,24.354,23.171,23.93,22.963,24.056,24.81,24.191,19.021,19.458,18.96,24.199,24.41,23.011,22.954,24.594,22.815,25.33,24.98,25.261,21.297,21.789,21.572,24.284,23.909,22.864,26.106,23.31,24.659,23.289,24.94,24.923,25.054,19.046,19.05,19.334,0,4.2],

    [1421, '2010-06-11T01:27:00.0000000Z',20.369,23.336,23.611,20.365,20.053,19.819,19.486,28.244,28.009,19.889,19.72,19.798,19.778,20.653,20.435,21.088,21.325,21.198,21.461,-99999,20.85,19.996,19.646,19.753,19.412,20.242,21.268,-99999,24.246,24.123,22.932,22.879,24.217,23.112,24.466,24.429,24.4,21.676,21.57,21.381,24.144,23.736,22.76,24.343,23.173,23.92,22.956,24.054,24.783,24.18,19.015,19.464,18.965,24.17,24.39,23.003,22.934,24.581,22.827,25.297,24.968,25.236,21.288,21.784,21.592,24.272,23.909,22.86,26.077,23.297,24.646,23.281,24.923,24.927,25.045,19.049,19.058,19.354,0,4.2],

    [1422, '2010-06-11T01:28:00.0000000Z',20.36,23.322,23.604,20.376,20.282,19.961,19.559,28.234,28.061,19.99,19.748,19.793,19.752,20.668,20.459,21.099,21.287,21.16,21.382,-99999,20.84,19.99,19.637,19.752,19.427,20.249,21.275,-99999,24.231,24.117,22.909,22.872,24.198,23.085,24.488,24.406,24.39,21.69,21.555,21.379,24.145,23.721,22.762,24.325,23.154,23.897,22.946,24.039,24.76,24.174,19.025,19.457,18.959,24.175,24.386,23.008,22.922,24.574,22.861,25.306,24.969,25.217,21.293,21.777,21.564,24.268,23.889,22.853,26.066,23.306,24.647,23.273,24.928,24.908,25.03,19.058,19.063,19.355,0,4.1],

    [1423, '2010-06-11T01:29:00.0000000Z',20.349,23.315,23.593,20.287,19.888,19.551,19.082,28.263,28.077,19.921,19.691,19.781,19.724,20.66,20.451,21.05,21.337,21.153,21.358,-99999,20.845,19.995,19.642,19.757,19.428,20.246,21.263,-99999,24.216,24.119,22.927,22.866,24.221,23.091,24.473,24.383,24.383,21.692,21.569,21.376,24.131,23.707,22.76,24.314,23.148,23.894,22.935,24.029,24.742,24.159,19.035,19.475,18.981,24.172,24.384,23.001,22.936,24.551,22.817,25.295,24.933,25.202,21.307,21.791,21.574,24.249,23.887,22.842,26.043,23.299,24.632,23.258,24.921,24.905,25.027,19.068,19.076,19.36,0,4.2],

    [1424, '2010-06-11T01:31:00.0000000Z',20.321,23.296,23.572,20.264,20.087,19.832,19.507,28.208,28.026,19.968,19.725,19.82,19.742,20.477,20.342,20.904,21.097,21.039,21.306,-99999,20.847,20.001,19.651,19.758,19.45,20.247,21.273,-99999,24.202,24.083,22.908,22.855,24.177,23.072,24.454,24.373,24.36,21.673,21.562,21.362,24.12,23.688,22.737,24.303,23.137,23.867,22.916,24.01,24.707,24.136,19.04,19.477,18.979,24.155,24.363,22.964,22.895,24.534,22.805,25.291,24.937,25.165,21.294,21.778,21.565,24.237,23.874,22.829,26.01,23.287,24.607,23.25,24.9,24.88,25.006,19.076,19.084,19.364,0,4.2],

    [1425, '2010-06-11T01:32:00.0000000Z',20.307,23.286,23.563,20.569,20.343,20.249,19.994,28.202,28.052,19.99,19.756,19.756,19.797,20.672,20.467,21.049,21.201,21.07,21.283,-99999,20.844,19.994,19.645,19.756,19.456,20.249,21.267,-99999,24.199,24.089,22.881,22.841,24.163,23.057,24.452,24.35,24.354,21.662,21.568,21.355,24.106,23.702,22.697,24.289,23.135,23.869,22.906,24,24.692,24.13,19.046,19.474,18.993,24.146,24.345,22.967,22.905,24.521,22.762,25.269,24.928,25.151,21.285,21.789,21.568,24.227,23.869,22.82,25.988,23.277,24.606,23.236,24.883,24.875,25.009,19.083,19.095,19.375,0,4.2],

    [1426, '2010-06-11T01:33:00.0000000Z',20.292,23.282,23.553,20.817,20.653,20.563,20.345,28.22,28.066,19.971,19.749,19.803,19.712,20.945,20.497,21.232,21.387,21.182,21.293,-99999,20.846,19.992,19.638,19.758,19.453,20.247,21.26,-99999,24.191,24.073,22.894,22.844,24.138,23.065,24.435,24.354,24.338,21.687,21.564,21.38,24.077,23.681,22.706,24.293,23.134,23.861,22.91,23.995,24.684,24.118,19.054,19.491,19.005,24.116,24.336,22.945,22.9,24.511,22.81,25.239,24.91,25.15,21.288,21.767,21.575,24.214,23.851,22.822,25.967,23.272,24.588,23.231,24.877,24.861,24.991,19.077,19.102,19.378,0,4.2],

    [1427, '2010-06-11T01:34:00.0000000Z',20.286,23.271,23.54,21.061,20.926,20.815,20.577,28.254,28.112,19.895,19.739,19.784,19.731,21.147,20.598,21.332,21.451,21.229,21.422,-99999,20.836,19.994,19.644,19.747,19.451,20.236,21.238,-99999,24.193,24.074,22.875,22.834,24.164,23.059,24.409,24.352,24.323,21.676,21.549,21.373,24.087,23.667,22.715,24.286,23.128,23.854,22.895,23.985,24.669,24.111,19.06,19.492,19.007,24.111,24.327,22.948,22.883,24.494,22.773,25.206,24.897,25.145,21.287,21.762,21.57,24.205,23.85,22.822,25.954,23.259,24.572,23.222,24.861,24.852,24.979,19.089,19.093,19.382,0,4.2],

    [1428, '2010-06-11T01:35:00.0000000Z',20.281,23.263,23.533,21.262,21.172,21.016,20.803,28.246,28.064,19.924,19.718,19.809,19.706,21.311,20.63,21.414,21.541,21.283,21.475,-99999,20.831,19.99,19.64,19.747,19.451,20.228,21.233,-99999,24.168,24.062,22.875,22.834,24.135,23.05,24.421,24.323,24.298,21.66,21.553,21.361,24.074,23.662,22.703,24.27,23.107,23.85,22.895,23.985,24.636,24.103,19.068,19.505,19.019,24.116,24.316,22.937,22.892,24.491,22.798,25.224,24.882,25.15,21.28,21.755,21.571,24.198,23.831,22.815,25.935,23.256,24.573,23.219,24.862,24.845,24.975,19.094,19.115,19.387,0,4.2],

    [1429, '2010-06-11T01:36:00.0000000Z',20.28,23.252,23.522,21.433,21.351,21.097,20.736,28.229,28.075,19.894,19.713,19.824,19.689,21.491,20.605,21.552,21.622,21.286,21.503,-99999,20.835,19.985,19.635,19.75,19.458,20.235,21.224,-99999,24.17,24.047,22.872,22.827,24.125,23.04,24.394,24.304,24.304,21.661,21.555,21.346,24.072,23.644,22.692,24.259,23.109,23.835,22.889,23.966,24.63,24.092,19.078,19.502,19.025,24.092,24.308,22.925,22.864,24.483,22.786,25.191,24.874,25.11,21.28,21.768,21.551,24.186,23.827,22.803,25.927,23.256,24.569,23.203,24.833,24.833,24.972,19.099,19.107,19.399,0,4.2],

    [1430, '2010-06-11T01:37:00.0000000Z',20.28,23.242,23.512,21.429,21.585,21.228,20.49,28.184,28.01,19.948,19.709,19.82,19.68,21.638,20.601,21.65,21.72,21.331,21.306,-99999,20.83,19.98,19.631,19.738,19.454,20.227,21.216,-99999,24.143,24.029,22.833,22.817,24.118,23.021,24.383,24.294,24.302,21.655,21.544,21.36,24.057,23.633,22.698,24.249,23.103,23.825,22.878,23.951,24.603,24.082,19.076,19.508,19.022,24.083,24.299,22.883,22.875,24.474,22.777,25.202,24.865,25.121,21.279,21.758,21.55,24.177,23.818,22.789,25.905,23.251,24.551,23.194,24.824,24.816,24.954,19.106,19.118,19.402,0,4.1],

    [1431, '2010-06-11T01:38:00.0000000Z',20.28,23.233,23.504,21.474,21.695,21.273,20.514,28.087,27.881,20.005,19.709,19.804,19.693,21.695,20.633,21.708,21.749,21.142,21.179,-99999,20.826,19.98,19.635,19.738,19.458,20.227,21.208,-99999,24.143,24.004,22.849,22.812,24.118,23.033,24.371,24.285,24.281,21.634,21.548,21.351,24.041,23.629,22.698,24.244,23.098,23.808,22.865,23.943,24.587,24.069,19.076,19.508,19.03,24.071,24.287,22.896,22.863,24.454,22.748,25.194,24.857,25.113,21.275,21.763,21.57,24.173,23.81,22.789,25.889,23.239,24.547,23.198,24.828,24.816,24.95,19.11,19.135,19.402,0,4.2],

    [1432, '2010-06-11T01:39:00.0000000Z',20.286,23.225,23.492,21.553,21.668,21.385,20.499,28.068,27.91,19.924,19.702,19.776,19.694,21.77,20.63,21.758,21.75,21.069,21.213,-99999,20.827,19.986,19.628,19.743,19.463,20.22,21.209,-99999,24.114,24.004,22.853,22.8,24.114,23.025,24.391,24.277,24.261,21.667,21.536,21.347,24.036,23.621,22.71,24.232,23.094,23.8,22.865,23.935,24.57,24.057,19.084,19.516,19.047,24.071,24.275,22.912,22.831,24.458,22.778,25.187,24.849,25.044,21.276,21.755,21.562,24.149,23.798,22.79,25.865,23.227,24.532,23.178,24.812,24.8,24.935,19.115,19.131,19.415,0,4.2],

    [1433, '2010-06-11T01:41:00.0000000Z',20.293,23.206,23.475,21.634,21.831,21.368,20.634,28.144,27.95,19.985,19.738,19.755,19.685,21.855,20.679,21.794,21.769,21.126,21.257,-99999,20.822,19.985,19.635,19.738,19.471,20.227,21.196,-99999,24.095,23.989,22.826,22.789,24.087,23.006,24.36,24.234,24.254,21.652,21.537,21.365,24.026,23.606,22.695,24.213,23.075,23.781,22.842,23.916,24.539,24.038,19.089,19.526,19.048,24.054,24.258,22.944,22.859,24.425,22.757,25.154,24.836,25.036,21.263,21.754,21.549,24.132,23.777,22.761,25.844,23.23,24.515,23.173,24.804,24.787,24.914,19.122,19.143,19.427,0,4.2],

    [1434, '2010-06-11T01:42:00.0000000Z',20.3,23.202,23.465,21.756,21.904,21.465,20.608,28.099,27.933,19.947,19.717,19.745,19.704,21.895,20.662,21.838,21.785,21.154,21.224,-99999,20.826,19.976,19.634,19.741,19.478,20.226,21.195,-99999,24.115,23.997,22.809,22.785,24.091,23.01,24.339,24.233,24.258,21.664,21.545,21.344,24.009,23.597,22.691,24.213,23.071,23.777,22.842,23.916,24.527,24.038,19.106,19.546,19.052,24.024,24.256,22.926,22.836,24.431,22.742,25.164,24.822,25.054,21.269,21.736,21.552,24.122,23.771,22.763,25.83,23.232,24.509,23.159,24.793,24.773,24.911,19.133,19.145,19.421,0,4.1],

    [1435, '2010-06-11T01:43:00.0000000Z',20.308,23.189,23.458,21.702,21.894,21.485,20.599,28.073,27.928,20.004,19.703,19.773,19.703,21.939,20.698,21.817,21.763,21.124,21.239,-99999,20.825,19.987,19.634,19.732,19.481,20.225,21.194,-99999,24.086,23.972,22.793,22.78,24.074,22.993,24.339,24.221,24.233,21.635,21.528,21.348,23.997,23.585,22.666,24.184,23.058,23.768,22.834,23.903,24.51,24.025,19.105,19.533,19.056,24.045,24.245,22.931,22.8,24.407,22.751,25.14,24.811,25.059,21.265,21.745,21.56,24.114,23.76,22.759,25.811,23.229,24.493,23.151,24.778,24.758,24.904,19.142,19.162,19.43,0,4.2],

    [1436, '2010-06-11T01:44:00.0000000Z',20.313,23.183,23.446,21.81,21.842,21.519,20.584,28.099,27.957,19.935,19.672,19.738,19.668,21.994,20.658,21.851,21.81,21.162,21.236,-99999,20.826,19.976,19.635,19.738,19.487,20.227,21.191,-99999,24.08,23.958,22.819,22.778,24.064,22.983,24.345,24.219,24.239,21.629,21.526,21.35,23.999,23.579,22.656,24.186,23.056,23.754,22.831,23.893,24.496,24.019,19.111,19.543,19.062,24.025,24.229,22.903,22.788,24.4,22.752,25.128,24.803,25.059,21.262,21.737,21.565,24.106,23.748,22.735,25.807,23.209,24.493,23.136,24.762,24.754,24.892,19.138,19.163,19.438,0,4.2],

    [1437, '2010-06-11T01:45:00.0000000Z',20.323,23.174,23.437,21.32,21.136,20.861,20.311,28.101,27.968,19.966,19.699,19.74,19.707,21.808,20.656,21.853,21.886,21.21,21.308,-99999,20.828,19.991,19.633,19.744,19.493,20.241,21.189,-99999,24.08,23.974,22.811,22.778,24.072,22.982,24.324,24.178,24.239,21.641,21.53,21.354,23.974,23.574,22.684,24.182,23.056,23.75,22.823,23.88,24.479,24.011,19.115,19.547,19.066,24.024,24.219,22.894,22.779,24.387,22.746,25.123,24.773,25.021,21.265,21.74,21.556,24.105,23.747,22.734,25.794,23.208,24.48,23.143,24.757,24.753,24.883,19.145,19.166,19.446,0,4.2],

    [1438, '2010-06-11T01:46:00.0000000Z',20.329,23.168,23.429,20.6,20.419,20.004,19.564,28.074,27.928,19.893,19.692,19.757,19.675,21.026,20.571,21.535,21.707,21.321,21.285,-99999,20.825,19.979,19.626,19.745,19.494,20.242,21.186,-99999,24.069,23.968,22.8,22.78,24.057,22.98,24.322,24.175,24.232,21.622,21.524,21.36,23.976,23.568,22.653,24.175,23.041,23.739,22.821,23.878,24.465,23.996,19.121,19.549,19.084,24,24.228,22.915,22.809,24.379,22.727,25.148,24.774,25.051,21.257,21.745,21.557,24.098,23.747,22.739,25.774,23.209,24.473,23.131,24.754,24.742,24.884,19.15,19.183,19.446,0,4.2],

    [1439, '2010-06-11T01:47:00.0000000Z',20.332,23.158,23.42,20.426,20.171,19.691,19.415,28.093,27.911,19.871,19.728,19.777,19.715,20.681,20.459,21.202,21.415,21.3,21.431,-99999,20.828,19.991,19.637,19.744,19.505,20.25,21.206,-99999,24.059,23.937,22.806,22.765,24.035,22.965,24.312,24.185,24.222,21.64,21.538,21.337,23.957,23.562,22.679,24.161,23.035,23.733,22.802,23.871,24.454,23.998,19.127,19.555,19.082,23.999,24.215,22.868,22.799,24.374,22.729,25.114,24.773,25.013,21.276,21.739,21.555,24.088,23.746,22.746,25.76,23.203,24.459,23.126,24.748,24.724,24.882,19.153,19.173,19.457,0,4.1],

    [1440, '2010-06-11T01:48:00.0000000Z',20.327,23.147,23.41,20.298,20.014,19.706,19.401,28.06,27.947,19.94,19.706,19.813,19.677,20.606,20.441,21.09,21.328,21.2,21.455,-99999,20.831,19.985,19.636,19.747,19.517,20.257,21.209,-99999,24.04,23.926,22.804,22.755,24.02,22.967,24.301,24.171,24.199,21.621,21.515,21.343,23.951,23.563,22.677,24.154,23.033,23.714,22.8,23.857,24.431,23.979,19.133,19.549,19.088,23.997,24.205,22.883,22.789,24.376,22.728,25.105,24.771,25.007,21.263,21.734,21.541,24.083,23.736,22.736,25.751,23.202,24.454,23.116,24.735,24.714,24.861,19.164,19.188,19.46,0,4.2],

    [1441, '2010-06-11T01:49:00.0000000Z',20.321,23.141,23.402,20.37,20.194,19.886,19.487,28.095,28.018,19.935,19.696,19.779,19.709,20.629,20.379,21.035,21.269,21.13,21.4,-99999,20.826,19.992,19.643,19.75,19.524,20.264,21.22,-99999,24.042,23.928,22.806,22.765,24.038,22.965,24.274,24.14,24.177,21.632,21.517,21.341,23.953,23.549,22.667,24.152,23.026,23.724,22.797,23.855,24.425,23.965,19.143,19.563,19.094,23.969,24.201,22.822,22.802,24.364,22.724,25.076,24.771,24.999,21.271,21.73,21.541,24.075,23.728,22.712,25.739,23.198,24.454,23.116,24.726,24.71,24.857,19.172,19.192,19.472,0,4.2],

    [1442, '2010-06-11T01:51:00.0000000Z',20.309,23.122,23.386,20.103,19.787,19.367,18.956,28.163,28.095,19.894,19.68,19.77,19.709,20.629,20.415,21.002,21.244,21.092,21.322,-99999,20.834,19.996,19.651,19.762,19.54,20.272,21.22,-99999,24.015,23.909,22.803,22.742,24.011,22.938,24.28,24.121,24.154,21.617,21.526,21.346,23.934,23.522,22.615,24.125,23.015,23.701,22.774,23.832,24.382,23.946,19.144,19.572,19.095,23.978,24.177,22.884,22.794,24.348,22.72,25.093,24.739,24.991,21.259,21.73,21.546,24.055,23.708,22.7,25.711,23.19,24.442,23.104,24.715,24.707,24.837,19.181,19.209,19.477,0,4.2],

    [1443, '2010-06-11T01:52:00.0000000Z',20.289,23.113,23.38,20.034,19.783,19.285,18.94,28.128,28.035,19.997,19.742,19.754,19.738,20.445,20.264,20.851,21.171,21.015,21.245,-99999,20.835,19.993,19.648,19.759,19.541,20.272,21.228,-99999,23.999,23.893,22.778,22.733,23.99,22.934,24.243,24.117,24.162,21.625,21.502,21.342,23.917,23.513,22.631,24.121,23.003,23.681,22.774,23.819,24.378,23.942,19.152,19.572,19.107,23.971,24.183,22.861,22.783,24.338,22.693,25.054,24.729,24.961,21.265,21.736,21.556,24.044,23.702,22.714,25.704,23.188,24.427,23.098,24.704,24.688,24.83,19.186,19.211,19.487,0,4.2],

    [1444, '2010-06-11T01:53:00.0000000Z',20.275,23.107,23.368,20.255,20.053,19.86,19.568,28.118,28.038,19.905,19.708,19.749,19.749,20.485,20.292,20.87,21.1,20.977,21.19,-99999,20.833,20,19.65,19.765,19.552,20.283,21.235,-99999,23.984,23.89,22.768,22.731,23.984,22.94,24.253,24.111,24.155,21.647,21.524,21.34,23.911,23.507,22.633,24.115,23.005,23.687,22.764,23.813,24.359,23.927,19.158,19.578,19.121,23.956,24.172,22.862,22.784,24.326,22.711,25.055,24.721,24.962,21.258,21.717,21.561,24.037,23.678,22.723,25.685,23.185,24.416,23.091,24.693,24.677,24.823,19.191,19.216,19.5,0,4.2],

    [1445, '2010-06-11T01:54:00.0000000Z',20.26,23.099,23.361,20.581,20.4,20.334,20.014,28.132,28.059,19.911,19.685,19.817,19.722,20.696,20.408,21.007,21.114,21.036,21.184,-99999,20.831,20.002,19.652,19.759,19.553,20.281,21.221,-99999,24.008,23.882,22.743,22.723,24.012,22.927,24.224,24.102,24.131,21.61,21.503,21.331,23.894,23.49,22.657,24.106,22.984,23.67,22.764,23.809,24.347,23.923,19.162,19.582,19.117,23.952,24.148,22.789,22.793,24.311,22.72,25.035,24.706,24.934,21.246,21.729,21.545,24.026,23.679,22.703,25.682,23.185,24.413,23.087,24.681,24.669,24.82,19.192,19.225,19.497,0,4.2],

    [1446, '2010-06-11T01:55:00.0000000Z',20.249,23.096,23.348,20.824,20.635,20.582,20.294,28.161,28.093,19.908,19.694,19.801,19.698,20.914,20.499,21.176,21.287,21.107,21.291,-99999,20.828,19.994,19.649,19.752,19.558,20.278,21.209,-99999,24.01,23.88,22.757,22.729,23.982,22.933,24.226,24.096,24.128,21.604,21.509,21.333,23.884,23.496,22.614,24.108,22.994,23.668,22.761,23.802,24.344,23.925,19.177,19.596,19.14,23.944,24.139,22.809,22.764,24.294,22.678,25.063,24.709,24.921,21.258,21.721,21.541,24.009,23.674,22.699,25.665,23.16,24.4,23.07,24.673,24.661,24.803,19.183,19.225,19.492,0,4.2],

    [1447, '2010-06-11T01:56:00.0000000Z',20.243,23.086,23.342,21.018,20.949,20.805,20.493,28.163,28.111,19.93,19.708,19.754,19.708,21.145,20.53,21.281,21.437,21.186,21.383,-99999,20.821,19.992,19.647,19.745,19.56,20.263,21.207,-99999,24.008,23.89,22.747,22.726,23.996,22.927,24.232,24.077,24.114,21.597,21.507,21.327,23.894,23.494,22.596,24.094,22.984,23.657,22.751,23.792,24.322,23.91,19.174,19.602,19.141,23.938,24.137,22.795,22.766,24.292,22.68,25.033,24.703,24.907,21.264,21.719,21.543,24.003,23.668,22.68,25.659,23.166,24.386,23.073,24.659,24.65,24.789,19.206,19.227,19.498,0,4.2],

    [1448, '2010-06-11T01:57:00.0000000Z',20.239,23.076,23.335,21.199,21.104,20.916,20.739,28.163,28.078,19.869,19.684,19.716,19.667,21.313,20.567,21.359,21.49,21.232,21.449,-99999,20.825,19.992,19.634,19.749,19.556,20.255,21.182,-99999,23.998,23.855,22.773,22.712,23.977,22.916,24.193,24.063,24.103,21.644,21.517,21.333,23.883,23.488,22.614,24.083,22.977,23.643,22.74,23.773,24.299,23.904,19.172,19.604,19.135,23.926,24.134,22.832,22.718,24.301,22.697,25.017,24.659,24.904,21.261,21.711,21.544,24,23.661,22.677,25.652,23.163,24.378,23.061,24.659,24.635,24.794,19.207,19.232,19.503,0,4.2],

    [1449, '2010-06-11T01:58:00.0000000Z',20.236,23.069,23.325,21.303,21.332,21.053,20.946,28.117,28.044,19.866,19.69,19.723,19.681,21.438,20.573,21.504,21.574,21.283,21.422,-99999,20.823,19.982,19.632,19.743,19.558,20.261,21.176,-99999,23.975,23.861,22.75,22.71,23.946,22.906,24.199,24.061,24.122,21.601,21.502,21.322,23.885,23.481,22.583,24.081,22.979,23.645,22.738,23.771,24.297,23.893,19.186,19.606,19.149,23.921,24.116,22.835,22.741,24.283,22.7,25.032,24.678,24.89,21.247,21.718,21.546,23.986,23.656,22.663,25.638,23.158,24.377,23.052,24.65,24.63,24.776,19.218,19.247,19.51,0,4.2],

    [1450, '2010-06-11T01:59:00.0000000Z',20.241,23.065,23.317,21.439,21.516,21.205,20.516,28.125,28.004,19.883,19.661,19.751,19.677,21.578,20.581,21.594,21.602,21.168,21.328,-99999,20.819,19.982,19.636,19.747,19.57,20.257,21.176,-99999,23.995,23.848,22.742,22.709,23.967,22.91,24.207,24.052,24.101,21.609,21.51,21.326,23.889,23.473,22.611,24.077,22.971,23.636,22.734,23.763,24.285,23.889,19.198,19.614,19.153,23.908,24.108,22.819,22.733,24.267,22.659,25.008,24.654,24.906,21.263,21.706,21.538,23.99,23.647,22.671,25.626,23.153,24.361,23.043,24.638,24.621,24.772,19.222,19.251,19.518,0,4.2]
  ]
end

total = array_matrix.size
array_matrix.each_with_index do |array_row, i|
  puts "Sending row #{i + 1} / #{total}"
  Pusher['experiment-channel'].trigger('meassurement-added', {rawData: array_row.to_s})
  sleep(5)
end