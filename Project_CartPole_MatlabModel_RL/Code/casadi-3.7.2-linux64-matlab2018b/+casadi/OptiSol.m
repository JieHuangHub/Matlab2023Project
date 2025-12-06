classdef  OptiSol < casadi.PrintableCommon
    %OPTISOL [INTERNAL] 
    %
    %
    %A simplified interface for NLP modeling/solving.
    %
    %This class offers a view with solution retrieval facilities The API is
    % 
    %guaranteed to be stable.
    %
    %Joris Gillis, Erik Lambrechts
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1v
    %
    %C++ includes: optistack.hpp
    %
    %
  methods
    function varargout = type_name(self,varargin)
    %TYPE_NAME [INTERNAL] 
    %
    %  char = TYPE_NAME(self)
    %
    %
      [varargout{1:nargout}] = casadiMEX(1410, self, varargin{:});
    end
    function varargout = disp(self,varargin)
    %DISP [INTERNAL] 
    %
    %  std::ostream & = DISP(self, bool more)
    %
    %
      [varargout{1:nargout}] = casadiMEX(1411, self, varargin{:});
    end
    function varargout = str(self,varargin)
    %STR [INTERNAL] 
    %
    %  char = STR(self, bool more)
    %
    %
      [varargout{1:nargout}] = casadiMEX(1412, self, varargin{:});
    end
    function varargout = value(self,varargin)
    %VALUE [INTERNAL] 
    %
    %  double = VALUE(self, DM x, {MX} values)
    %  double = VALUE(self, SX x, {MX} values)
    %  double = VALUE(self, MX x, {MX} values)
    %
    %Obtain value of expression at the current value
    %
    %In regular mode, teh current value is the converged solution In debug 
    %mode,
    % the value can be non-converged
    %
    %Parameters:
    %-----------
    %
    %values: 
    %Optional assignment expressions (e.g. x==3) to overrule the current
    % 
    %value
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L679
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L874-L876
    %
    %
    %
    %.......
    %
    %::
    %
    %  VALUE(self, DM x, {MX} values)
    %
    %
    %
    %[INTERNAL] 
    %Obtain value of expression at the current value
    %
    %In regular mode, teh current value is the converged solution In debug 
    %mode,
    % the value can be non-converged
    %
    %Parameters:
    %-----------
    %
    %values: 
    %Optional assignment expressions (e.g. x==3) to overrule the current
    % 
    %value
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L678
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L871-L873
    %
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  VALUE(self, SX x, {MX} values)
    %
    %
    %
    %[INTERNAL] 
    %Obtain value of expression at the current value
    %
    %In regular mode, teh current value is the converged solution In debug 
    %mode,
    % the value can be non-converged
    %
    %Parameters:
    %-----------
    %
    %values: 
    %Optional assignment expressions (e.g. x==3) to overrule the current
    % 
    %value
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L679
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L874-L876
    %
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  VALUE(self, MX x, {MX} values)
    %
    %
    %
    %[INTERNAL] 
    %Obtain value of expression at the current value
    %
    %In regular mode, teh current value is the converged solution In debug 
    %mode,
    % the value can be non-converged
    %
    %Parameters:
    %-----------
    %
    %values: 
    %Optional assignment expressions (e.g. x==3) to overrule the current
    % 
    %value
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L677
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L868-L870
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(1413, self, varargin{:});
    end
    function varargout = value_variables(self,varargin)
    %VALUE_VARIABLES [INTERNAL] 
    %
    %  {MX} = VALUE_VARIABLES(self)
    %
    %get assignment expressions for the optimal solution
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L683
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L878-L880
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1414, self, varargin{:});
    end
    function varargout = value_parameters(self,varargin)
    %VALUE_PARAMETERS [INTERNAL] 
    %
    %  {MX} = VALUE_PARAMETERS(self)
    %
    %
      [varargout{1:nargout}] = casadiMEX(1415, self, varargin{:});
    end
    function varargout = stats(self,varargin)
    %STATS [INTERNAL] 
    %
    %  struct = STATS(self)
    %
    %Get statistics.
    %
    %nlpsol stats are passed as-is. No stability can be guaranteed about 
    %this 
    %part of the API
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1w
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.hpp#L692
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/optistack.cpp#L886-L888
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1416, self, varargin{:});
    end
    function varargout = opti(self,varargin)
    %OPTI [INTERNAL] 
    %
    %  Opti = OPTI(self)
    %
    %
      [varargout{1:nargout}] = casadiMEX(1417, self, varargin{:});
    end
    function self = OptiSol(varargin)
    %OPTISOL 
    %
    %  new_obj = OPTISOL()
    %
    %
      self@casadi.PrintableCommon(SwigRef.Null);
      if nargin==1 && strcmp(class(varargin{1}),'SwigRef')
        if ~isnull(varargin{1})
          self.swigPtr = varargin{1}.swigPtr;
        end
      else
        tmp = casadiMEX(1418, varargin{:});
        self.swigPtr = tmp.swigPtr;
        tmp.SwigClear();
      end
    end
    function delete(self)
        if self.swigPtr
          casadiMEX(1419, self);
          self.SwigClear();
        end
    end
  end
  methods(Static)
  end
end
