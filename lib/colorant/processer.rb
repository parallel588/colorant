module Colorant
  class Processer
    attr_reader :colors, :depth, :file, :data, :quantize, :crop

    def initialize(file, options = {})
      @file = file
      @colors = options[:colors] ? options[:colors].to_i : 8
      @depth = options[:depth] ? options[:depth].to_i : 16
      @quantize = options[:quantize] ? options[:quantize] : 'YIQ'
      @crop = options.fetch(:crop) { '80x60%' }

      @reporter_options = {
        reporter: options[:reporter],
        extended: options[:extended]
      }
      @data = []
    end

    def process!
      raw_data = `convert #{file.shellescape} -gravity Center -crop #{crop} +repage -format %c -dither None -quantize #{quantize}  -colors #{colors.to_i} -depth #{depth.to_i} histogram:info:- | sort -r -k 1`
      @data = Parser.parse(raw_data)
      Reporter.report(@data, @reporter_options)
    end

    class << self
      def process(*args)
        instance = new(*args)
        instance.process!
      end
    end

  end
end
