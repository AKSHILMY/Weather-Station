import { useState, useEffect } from "react";
import React from "react";

export default function GetData() {
  const [data, setData] = useState({});
  const [category, setCategory] = useState([]);

  useEffect(() => {
    const getdata = async () => {
      const res = await fetch("http://localhost:5000/home");
      const getdata = await res.json();
      setData(getdata);
      // console.log(getdata);
    };
  });
  console.log(data);
  return data;
}
