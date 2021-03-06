#=
Constants
=#

#Constant parameters

@static if is_unix()
    base_path=string(dirname(Base.source_path()),"/../lib/")
    intan_lib = string(base_path,"libokFrontPanel.so")
    #const lib = Libdl.dlopen(intan_lib,Libdl.RTLD_NOW)
end

@static if is_windows()
    base_path=string(dirname(Base.source_path()),"\\..\\lib\\")
    intan_lib = string(base_path,"okFrontPanel.dll")
end
	
const bit = string(base_path,"main.bit")
const usb3bit = string(base_path,"XEM6310_512ch.bit")
#const usb3bit = string(base_path,"rhd2000_usb3.bit")

const USB_BUFFER_SIZE = 2400000
const RHYTHM_BOARD_ID = 500
const MAX_NUM_DATA_STREAMS = 16
const FIFO_CAPACITY_WORDS = 67108864

#const SAMPLES_PER_DATA_BLOCK = 600
const SAMPLES_PER_DATA_BLOCK = 512
const USB3_BLOCK_SIZE = 1024

const DDR_BURST_LENGTH = 64

const RHD2000_HEADER_MAGIC_NUMBER = 0xc691199927021942

const WireInResetRun = 0x00
const WireInMaxTimeStepLsb = 0x01
const WireInMaxTimeStepMsb = 0x02
const WireInDataFreqPll = 0x03
const WireInMisoDelay = 0x04
const WireInCmdRamAddr = 0x05
const WireInCmdRamBank = 0x06
const WireInCmdRamData = 0x07
const WireInAuxCmdBank1 = 0x08
const WireInAuxCmdBank2 = 0x09
const WireInAuxCmdBank3 = 0x0a
const WireInAuxCmdLength1 = 0x0b
const WireInAuxCmdLength2 = 0x0c
const WireInAuxCmdLength3 = 0x0d
const WireInAuxCmdLoop1 = 0x0e
const WireInAuxCmdLoop2 = 0x0f
const WireInAuxCmdLoop3 = 0x10
const WireInLedDisplay = 0x11
const WireInDataStreamSel1234 = 0x12
const WireInDataStreamSel5678 = 0x13
const WireInDataStreamEn = 0x14
const WireInTtlOut = 0x15
const WireInDacSource1 = 0x16
const WireInDacSource2 = 0x17
const WireInDacSource3 = 0x18
const WireInDacSource4 = 0x19
const WireInDacSource5 = 0x1a
const WireInDacSource6 = 0x1b
const WireInDacSource7 = 0x1c
const WireInDacSource8 = 0x1d
const WireInDacManual = 0x1e
const WireInMultiUse = 0x1f

const TrigInDcmProg = 0x40
const TrigInSpiStart = 0x41
const TrigInRamWrite = 0x42
const TrigInDacThresh = 0x43
const TrigInDacHpf = 0x44
const TrigInExtFastSettle = 0x45
const TrigInExtDigOut = 0x46
const TrigInSetParam = 0x47

const WireOutNumWordsLsb = 0x20
const WireOutNumWordsMsb = 0x21
const WireOutSpiRunning = 0x22
const WireOutTtlIn = 0x23
const WireOutDataClkLocked = 0x24
const WireOutBoardMode = 0x25
const WireOutBoardId = 0x3e
const WireOutBoardVersion = 0x3f

const PipeOutData = 0xa0

#For 32 channel amps
const PortA1 = 0
const PortA2 = 1
const PortB1 = 2
const PortB2 = 3
const PortC1 = 4
const PortC2 = 5
const PortD1 = 6
const PortD2 = 7

#For 64 channel amps
const PortA1Ddr = 8
const PortA2Ddr = 9
const PortB1Ddr = 10
const PortB2Ddr = 11
const PortC1Ddr = 12
const PortC2Ddr = 13
const PortD1Ddr = 14
const PortD2Ddr = 15

const speedOfLight = 299792458.0
const xilinxLvdsOutputDelay=1.9e-9
const xilinxLvdsInputDelay=1.4e-9
const rhd2000Delay=9.0e-9
const misoSettleTime=6.7e-9
const cableVelocity=.555*speedOfLight

const jet_r,jet_g,jet_b=zeros(UInt32,256),zeros(UInt32,256),zeros(UInt32,256)
for i = 0:255
  n=4*i/256
  jet_r[i+1]=round(UInt32,255*min(max(min(n-1.5,-n+4.5),0),1));
  jet_g[i+1]=round(UInt32,255*min(max(min(n-0.5,-n+3.5),0),1));
  jet_b[i+1]=round(UInt32,255*min(max(min(n+0.5,-n+2.5),0),1));
end
