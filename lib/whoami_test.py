import platform
import os
import socket
import uuid

from .whoami import Whoami

test_case = Whoami()


def test_environ() -> None:
    assert test_case.get_environment_variables() == (
        ", ".join(map(str, list(os.environ.keys()))),
    )


def test_hostname() -> None:
    assert test_case.get_hostname() == socket.gethostname()


def test_ip() -> None:
    assert test_case.get_ip() == socket.gethostbyname(socket.gethostname())


def test_mac_() -> None:
    if (uuid.getnode() >> 40) % 2:
        assert test_case.get_mac() == "unknown"
    else:
        assert test_case.get_mac() == ":".join(
            ("%012X" % uuid.getnode())[i : i + 2] for i in range(0, 12, 2)
        )


def test_mac_address_formatted_correctly() -> None:
    macs_to_test = {
        53214316577880: "30:65:EC:6F:C4:58",
        18781295806437: "11:14:DC:77:07:E5",
        41738128741385: "25:F5:EA:56:54:09",
        17945637227415: "10:52:4B:55:0B:97",
        97423472426113: "58:9B:2B:77:7C:81",
    }
    for key in macs_to_test:
        assert test_case.format_mac(key).upper() == macs_to_test[key]


def test_platform() -> None:
    assert test_case.get_platform() == platform.platform()


def test_version() -> None:
    assert test_case.get_python_version() == platform.python_version()
