"""
Applet: CoinFlip
Summary: Flips a coin
Description: Flips a coin each display.
Author: Robert Ison
"""

load("render.star", "render")
load("schema.star", "schema")

COIN_FLIP_IMAGE = "R0lGODlhQAAgAOfzAAICAnaGjrbK0momHtrm1raCWjpGSm5aTqZaVkoWGv720ramim5ubtrGtp6mkuqmejYuKo6KdoZaVhoaGv7mwlJmbtrWylYuNv726j46LlZKQoZyXpaalv7u4tKSdrq2mnZiVvrWth4WKrJyVv7+1jYuSiYqKv7uyu6qtjo2LqaGapZ6du7e4r7e4nJGNrqKlrqqpopqZlJSavbeysZ2Vg4OCkZaZmpeUvLGmjoyJv7+6oZ6Ztq6pm6KrsrGqj5KZv725nJ2ivbm1ko+OqaahuaWcsq2pnZqXhoWFva6qtrq7qq+xpaSfioeHmJ6hj4+Ovby7qZ6di4uKraWisqqmhoOEoqGcoo6Nk5CPv76znpuYpqmso6KfpZWSlZuhkI6NmZGOv7atv7+4i4mIv7yzqKOlopOOpZqWl5SSv7eunpeZvbK0jYyLv7+9o56Zua+xsrKxqqamtaelsq6tn5qVraWenpWOkomKs6ieubKtjouJiIeGv7qxmJiYurWulY6Rq6yrury8ioOFsp6bsqapr6+wuaKepayzu6ykurGqtbSssaKatLa5m4yLs6KkurmvnI+VnaWqurm2rqqtrZ+djIWLmZOVtayjvbOtlomHuKajlpaWrLS5mY6Rua6tkpGVva2xraappZWWqKiosammppqdtKqspqGbs7S0o6aqoI6SqqKhpJ2impaZl5mdsZ+grJyboqKhuKeon6Gfnp2eq56hkJCQv7m0oZKSnZWTsqmioJuXqZeZtK6wvbWxoZqdv7y5uraxpZaZhISEqaGeubKxlpORoZ2YoZ+ai4qJv7y2npmVhYSEn5yYmJWSk5GOv7ivv7qztq+pv765ioiHo6KivrexqqaijoyLv722h4aGv7myv728j46Nv7+3v7u0m5eUnpqXv761v7y1v7+/op2Yop+ajIqJv727j46MvrWujo2Mg4ODv7+7v7+5jYyMn5qWjouKv7y3v///////////////////////////////////////////////////yH+EUNyZWF0ZWQgd2l0aCBHSU1QACH5BAEKAP8ALAAAAABAACAAAAj+AP8JHEiwoMGDCBMqXMiw4b8jR2bFijVLCwOHGDMiPGIOBow5IK99jAODVh+NKBui4bLAiJE5fpQJaWChnYWPC5DZSsnTIAgiRqSdUNCggbUZ0vLokJRHnhEYcZz1nHpjgVA/fvgU9UOF1IJieWboKCbN46apKUG0THPCTyIK8uIYaeByCikj1hpIkvT0E9qMGhZQ8SXNCCZ144hIasNCUgM/eRbw8IOhTbE5cZ78dbiAVAgKkENsg+OnTZsOQiwEEyJ3Bh8LhY1U28yQVgMeaaCdOAFNHikgwci1gQJFyExSDUBDaQP7JO2Ec6ikScOHD4UTfIV06MBtr5AZwQT+b4OmzLQPGM8TBjOim8zubxaISAPCrY0kDN+DwVglhAKZaTqo5ld6BU1iQSLQkKFANicI8RIMwRCHH00NFHOKENGcII4CkgQzG4EEwTEHNNBkY6I8qoEwhxEWFCPEasFIQ8o1QvChjAJkZNMAICASZIERFFAwzoJQkDQHFAt0IIkFewUzRwOr8HDCN+OY2MAkPQ4EhxF87MYHGcqggoxqDWBgwRRGkMKkJKsYUeU4fGRzU5YCzQEDBV9Gw8c0gRDznS+pnRJMMDRJ8mQ20yhwgpxx0PmPS2lcRwY040gCQwfK5DHFKXPMgEEHdFnwjYkMimEBE47GMYc1kfJGgQX+BNC0yhQWdDDDOHnMtU2O3mSjwDTFzOIoMnDkkRsFaWASDQEwNLBaG+0AIUZhM0STjTdimCjEHBfR+QUcVDRAChVG8JBHMRZA0QEw7SijQzsfLDCDYzNcO00wo7Dh6D/XzJGrYEFVCIUkymRTWRtzrGDBAlMEI8k001jgnKPGwHFJri49poAOcGDYzsdCeCUND+CZOclO+/7DhGGYtDpONDrMIY0f0cqzTR7XkCJNMNPMdEPKAqUwxwKYSINJCGRsA8UchAohHBkYyJUHotIQkQzQAjnjgy6YJIIJNNE82YA8bZBDjiTXOCuEGA0ssA7WA4FgBNeJhCCNBXD4AIdZiCsKgW02RlzzNtxxfzBFIuo08I0RMwjhwzRQBGNiMB9ckw7hBaVQRhxTSEPBYzM0MNNcMCywwxiYH2RMGSLpXBhIMFxDyzmpL6QBB3HkHkcsX2hT++8EBQQAOw=="

DEFAULT_WHO = "world"

def main(config):
    who = config.str("who", DEFAULT_WHO)
    message = "Hello, {}!".format(who)
    return render.Root(
        child = render.Image(src=COIN_FLIP_IMAGE),
    )

def get_schema():
    return schema.Schema(
        version = "1",
        fields = [
            schema.Text(
                id = "who",
                name = "Who?",
                desc = "Who to say hello to.",
                icon = "user",
            ),
        ],
    )
