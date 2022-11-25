import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, Timer, ClockCycles

@cocotb.test()
async def run_smoke_test(dut):
    dut._log.info("start")

    period = 1000    
    units  = "ns"

    dut.dclk_period.value = int(period)

    dut.record_vcd.value = 0
    dut.run_smoke_test.value = 0
    dut.run_measurement.value = 0
    dut.run_show_status.value = 1

    clock = Clock(dut.dclk, period, units=units)

    cocotb.start_soon(clock.start())
    await ClockCycles(dut.dclk, 1)

    dut._log.info("pass {}".format(dut.pass_flag))
    assert dut.pass_flag == 0

    await ClockCycles(dut.dclk, 10)

    dut._log.info("pass {}".format(dut.pass_flag))
    assert dut.pass_flag == 1
