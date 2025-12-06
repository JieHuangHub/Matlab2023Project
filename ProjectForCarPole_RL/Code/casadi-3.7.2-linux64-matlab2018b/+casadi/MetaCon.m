classdef  MetaCon < casadi.IndexAbstraction
    %METACON 
    %
    %   = METACON()
    %
    %
  methods
    function v = original(self)
      v = casadiMEX(1340, self);
    end
    function v = canon(self)
      v = casadiMEX(1341, self);
    end
    function v = type(self)
      v = casadiMEX(1342, self);
    end
    function v = lb(self)
      v = casadiMEX(1343, self);
    end
    function v = ub(self)
      v = casadiMEX(1344, self);
    end
    function v = n(self)
      v = casadiMEX(1345, self);
    end
    function v = flipped(self)
      v = casadiMEX(1346, self);
    end
    function v = dual_canon(self)
      v = casadiMEX(1347, self);
    end
    function v = dual(self)
      v = casadiMEX(1348, self);
    end
    function v = extra(self)
      v = casadiMEX(1349, self);
    end
    function v = linear_scale(self)
      v = casadiMEX(1350, self);
    end
    function self = MetaCon(varargin)
    %METACON 
    %
    %  new_obj = METACON()
    %
    %
      self@casadi.IndexAbstraction(SwigRef.Null);
      if nargin==1 && strcmp(class(varargin{1}),'SwigRef')
        if ~isnull(varargin{1})
          self.swigPtr = varargin{1}.swigPtr;
        end
      else
        tmp = casadiMEX(1351, varargin{:});
        self.swigPtr = tmp.swigPtr;
        tmp.SwigClear();
      end
    end
    function delete(self)
        if self.swigPtr
          casadiMEX(1352, self);
          self.SwigClear();
        end
    end
  end
  methods(Static)
  end
end
