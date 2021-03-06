
#=
Filters and Decoding Algorithms
=#

function make_filter(rhd::RHD2000,filter_type::String,wn1,wn2=0.0)

    if filter_type == "High Pass"
        responsetype = Highpass(wn1; fs = rhd.sr)
    elseif filter_type == "Low Pass"
        responsetype = Lowpass(wn1; fs = rhd.sr)
    elseif filter_type == "BandPass"
        responsetype = Bandpass(wn1,wn2; fs=rhd.sr)
    elseif filter_type == "BandStop"
        responsetype = Bandstop(wn1,wn2; fs=rhd.sr)
    end
    designmethod=Butterworth(4)
    df1=digitalfilter(responsetype,designmethod)
    DF2TFilter(df1)
end

function apply_filter(rhd::RHD2000,ff::MyFilter,chan_num::Int64)

    temp=zeros(Float64,SAMPLES_PER_DATA_BLOCK)
    for i=1:SAMPLES_PER_DATA_BLOCK
        temp[i]=convert(Float64,rhd.v[i,chan_num])
    end

    filt!(temp,ff,temp)

    for i=1:SAMPLES_PER_DATA_BLOCK
        rhd.v[i,chan_num] = round(Int16,temp[i])
    end
    nothing
end
