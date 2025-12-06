classdef  StreamStateGuard < SwigRef
    %STREAMSTATEGUARD [INTERNAL] C++ includes: casadi_misc.hpp
    %
    %
    %
    %
  methods
    function this = swig_this(self)
      this = casadiMEX(3, self);
    end
    function delete(self)
        if self.swigPtr
          casadiMEX(46, self);
          self.SwigClear();
        end
    end
    function self = StreamStateGuard(varargin)
    %STREAMSTATEGUARD 
    %
    %  new_obj = STREAMSTATEGUARD(std::ostream & os)
    %
    %
      if nargin==1 && strcmp(class(varargin{1}),'SwigRef')
        if ~isnull(varargin{1})
          self.swigPtr = varargin{1}.swigPtr;
        end
      else
        tmp = casadiMEX(47, varargin{:});
        self.swigPtr = tmp.swigPtr;
        tmp.SwigClear();
      end
    end
  end
  methods(Static)
  end
end
